require "json"
require "faraday"

module MobileKPI
  # Provides the iOS DataSource to get ratings
  module DataSource
    # Class in charge of getting the iOS Rating metrics
    class IOSRating

      def self.rating_endpoint
        @app_id ||= ENV["ITUNES_APP_ID"]
        "http://itunes.apple.com/lookup?id=#{@app_id}"
      end

      def self.rating
        @app_id ||= ENV["ITUNES_APP_ID"]
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