require "json"
require "faraday"

module MobileKPI
  # Provides the iOS DataSource to get ratings
  module DataSource
    # Class in charge of getting the iOS Rating metrics
    class IOSRating
      attr_accessor :app_id
      def initialize(app_id)
        @app_id = app_id
      end

      def rating_endpoint
        "http://itunes.apple.com/lookup?id=#{@app_id}"
      end

      def rating
        content = JSON.parse(Faraday.get(rating_endpoint).body)
        app_rating = MobileKPI::Entity::Rating.new

        app_rating.platform = "iOS"
        app_rating.name = content["results"][0]["trackName"]
        app_rating.bundle_identifier = content["results"][0]["bundleId"]
        app_rating.version = content["results"][0]["version"]
        app_rating.rating = content["results"][0]["averageUserRatingForCurrentVersion"]
        app_rating.rating_count = content["results"][0]["userRatingCountForCurrentVersion"]

        app_rating
      end
    end
  end
end