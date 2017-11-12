require "market_bot"
module MobileKPI
  # Provides the Android DataSource to get ratings
  module DataSource
    # Class in charge of getting the Android Rating metrics
    class AndroidRating
      attr_accessor :app_package
      def initialize(app_package)
        @app_package = app_package
      end

      def rating
        app = MarketBot::Play::App.new(@app_package)
        # Scrapes App Store
        app.update

        MobileKPI::Entity::Rating.new(platform: "Android",
                                      name: app.title,
                                      bundle_identifier: @app_package,
                                      version: app.current_version,
                                      rating: app.rating,
                                      rating_count: app.votes)

      end
    end
  end
end