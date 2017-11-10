module MobileKPI
  module Job
    # iOS Rating manager
    class RatingJob < Job
      def trigger
        manager = MobileKPI::Manager::IOSRatingManager.new
        manager.work
      end
    end
  end
end
