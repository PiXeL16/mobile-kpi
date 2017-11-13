require "sequel"
require "mysql2"

# Main database representation
module MobileKPI
  # Database Class
  class Database
    def database
      @_db ||= Sequel.connect(ENV["DATABASE_URL"])

      unless @_db.table_exists?("ratings")
        @_db.create_table :ratings do
          primary_key :id
          String      :platform
          String      :app_name
          String      :bundle_identifier
          String      :app_version
          DateTime    :date
          Float       :average_rating
          Integer     :rating_count
        end
      end

      unless @_db.table_exists?("crashes")
        @_db.create_table :crashes do
          primary_key :id
          String      :platform
          String      :app_name
          String      :bundle_identifier
          Integer     :crashes_count
          DateTime    :date
          DateTime    :from
          DateTime    :to
        end
      end

      unless @_db.table_exists?("oomfreesessions")
        @_db.create_table :oomfreesessions do
          primary_key :id
          String      :platform
          String      :app_name
          String      :bundle_identifier
          Float       :oom_free_sessions
          DateTime    :date
          DateTime    :from
          DateTime    :to
        end
      end

      @_db
    end

    def store_rating(app_rating)
      database[:ratings].insert(
          platform: app_rating.platform,
          app_name: app_rating.name,
          bundle_identifier: app_rating.bundle_identifier,
          app_version: app_rating.version,
          date: Time.now,
          average_rating: app_rating.rating,
          rating_count: app_rating.rating_count
      )
    end

    def store_crashes(app_crashes)
      database[:crashes].insert(
          platform: app_crashes.platform,
          app_name: app_crashes.name,
          bundle_identifier: app_crashes.bundle_identifier,
          crashes_count: app_crashes.crashes_count,
          date: Time.now,
          from: app_crashes.from,
          to: app_crashes.to
      )
    end

    def store_oom_free_sessions(oom_free_sessions)
      database[:oomfreesessions].insert(
          platform: oom_free_sessions.platform,
          app_name: oom_free_sessions.name,
          bundle_identifier: oom_free_sessions.bundle_identifier,
          oom_free_sessions: oom_free_sessions.oom_free_sessions,
          date: Time.now,
          from: oom_free_sessions.from,
          to: oom_free_sessions.to
      )
    end

  end
end
