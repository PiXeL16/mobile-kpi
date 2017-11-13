module MobileKPI
  module Job
    # Fabric OOM Free Sessions Job
    class OOMFreeSessionsJob < Job
      def self.build
        oom_free_manager = MobileKPI::Manager::OOMFreeSessionsManager.build
        new(oom_free_manager)
      end

      def initialize(oom_free_manager)
        @oom_free_manager = oom_free_manager
      end

      def trigger
        @oom_free_manager.work
      end
    end
  end
end
