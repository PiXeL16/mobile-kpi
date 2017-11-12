require "Fabricio"
require "active_support/all"
module MobileKPI
  # Provides the Android DataSource to get ratings
  module DataSource
    # Class in charge of proving information about Fabric Crash Rates
    class Crashes
      def initialize
        @client ||= Fabricio::Client.new do |config|
          config.username = ENV["FABRIC_USER_NAME"]
          config.password = ENV["FABRIC_PASSWORD"]
        end
      end

      # Return crash count and app information
      def crashes(app_package)
        # Get apps information
        app = app_from_package(app_package)
        # One day time period of crashes
        today_start = Time.now - 1.days
        today_end = Time.now

        crashes_count = crash_count(app, today_start, today_end)

        MobileKPI::Entity::Crashes.new(platform: app.platform,
                                                 name: app.name,
                                                 bundle_identifier: app.bundle_id,
                                                 crashes_count: crashes_count,
                                                 from: today_start,
                                                 to: today_end
        )
      end

      def app_from_package(app_package)
        apps = @client.app.all
        apps.find { |item| item.bundle_identifier == app_package }
      end

      def crash_free_percentage(app, date_start, date_end)
        crash_free = nil
        total_sessions = total_sessions(app, date_start, date_end)
        crash_count = crash_count(app, date_start, date_end)
        unless total_sessions.nil? && crash_count.nil?
          crash_free = (1 - crash_count.to_f / total_sessions.to_f) * 100.0
        end
        crash_free
      end

      # For some reason ,this returns empty for Android Platforms app ids, making it impossible to calculate crash free users
      # Issue has being open here: https://github.com/strongself/fabricio/issues/37
      def total_sessions(app, date_start, date_end)
        @client.app.total_sessions(app.id, date_start.to_i.to_s, date_end.to_i.to_s, ["all"])
      end

      def crash_count(app, date_start, date_end)
        @client.app.crashes(app.id, date_start.to_i.to_s, date_end.to_i.to_s, ["all"])
      end

    end
  end
end