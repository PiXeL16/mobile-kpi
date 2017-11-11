module MobileKPI
  module Job
    # iOS Rating manager
    class RatingJob < Job

      def initialize(manager: MobileKPI::Manager::IOSRatingManager.build)
        @manager = manager
      end

      def trigger
        @manager.work
      end
    end
  end
end
