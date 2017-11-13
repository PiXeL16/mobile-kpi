module MobileKPI
  module Manager
    # OOMFreeSessions manager
    class OOMFreeSessionsManager < Manager

      attr_reader :data_source, :database, :ios_bundle_identifier

      def self.build

        ios_app_bundle ||= ENV["IOS_APP_BUNDLE"]
        data_source = MobileKPI::DataSource::Fabric.new
        database = MobileKPI::Database.new
        self.new(data_source, database, ios_app_bundle)
      end

      def initialize(data_source, database, ios_bundle_identifier)
        @data_source = data_source
        @database = database
        @ios_bundle_identifier = ios_bundle_identifier
      end

      def work
        oom_free_sessions = @data_source.oom_free_sessions(@ios_bundle_identifier)
        @database.store_oom_free_sessions(oom_free_sessions)
      end

    end
  end
end
