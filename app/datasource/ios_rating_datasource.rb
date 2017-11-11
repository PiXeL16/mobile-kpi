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
        {
            platform: "iOS",
            app_version: content["results"][0]["version"],
            average_rating: content["results"][0]["averageUserRatingForCurrentVersion"],
            rating_count: content["results"][0]["userRatingCountForCurrentVersion"]
        }
      end
    end
  end
end