module MobileKPI
  module Job
    # Fabric Crashes Job
    class CrashesJob < Job
      def self.build
        crashes_manager = MobileKPI::Manager::CrashesManager.build
        new(crashes_manager)
      end

      def initialize(crashes_manager)
        @crashes_manager = crashes_manager
      end

      def trigger
        @crashes_manager.work
      end
    end
  end
end
