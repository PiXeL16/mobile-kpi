module MobileKPI
  module Manager
    # Crashes manager
    class CrashesManager < Manager

      attr_reader :data_source, :database, :android_app_package, :ios_bundle_identifier

      def self.build

        android_app_package ||= ENV["ANDROID_APP_PACKAGE"]
        ios_app_bundle ||= ENV["IOS_APP_BUNDLE"]
        data_source = MobileKPI::DataSource::Fabric.new
        database = MobileKPI::Database.new
        self.new(data_source, database, android_app_package, ios_app_bundle)
      end

      def initialize(data_source, database, android_app_package, ios_bundle_identifier)
        @data_source = data_source
        @database = database
        @android_app_package = android_app_package
        @ios_bundle_identifier = ios_bundle_identifier
      end

      def work
        ios_crashes = @data_source.crashes(@ios_bundle_identifier)
        android_crashes = @data_source.crashes(@android_app_package)
        @database.store_crashes(ios_crashes)
        @database.store_crashes(android_crashes)
      end

    end
  end
end
