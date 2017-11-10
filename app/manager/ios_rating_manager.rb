module MobileKPI
  module Manager
    # iOS Rating manager
    class IOSRatingManager < Manager
      def work
        ios_rating = MobileKPI::DataSource::IOSRating.rating
        store_rating(ios_rating)
      end

      def store_rating(rating)
        MobileKPI::Database.store_rating(platform: rating[:platform],
                                        app_version: rating[:app_version],
                                        average_rating: rating[:average_rating],
                                        rating_count: rating[:rating_count])
      end
    end
  end
end
