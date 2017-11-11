module MobileKPI
  module Manager
    # Rating manager
    class IOSRatingManager < Manager

      attr_reader :data_source, :database

      def self.build
        @app_id ||= ENV["ITUNES_APP_ID"]
        data_source = MobileKPI::DataSource::IOSRating.new(@app_id)
        database = MobileKPI::Database.new
        self.new(data_source, database)
      end

      def initialize(data_source, database)
        @data_source = data_source
        @database = database
      end

      def work
        ios_rating = @data_source.rating
        store_rating(ios_rating)
      end

      def store_rating(rating)
        @database.store_rating(platform: rating[:platform],
                               app_version: rating[:app_version],
                               average_rating: rating[:average_rating],
                               rating_count: rating[:rating_count])
      end
    end
  end
end
