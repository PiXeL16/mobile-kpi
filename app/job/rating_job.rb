module MobileKPI
  module Job
    # iOS Rating manager
    class RatingJob < Job
      def self.build
        ios_rating_manager = MobileKPI::Manager::IOSRatingManager.build
        android_rating_manager = MobileKPI::Manager::AndroidRatingManager.build
        new(ios_rating_manager, android_rating_manager)
      end

      def initialize(ios_rating_manager, android_rating_manager)
        @ios_rating_manager = ios_rating_manager
        @android_rating_manager = android_rating_manager
      end

      def trigger
        @ios_rating_manager.work
        @android_rating_manager.work
      end
    end
  end
end
