module MobileKPI
  module Manager
    # Rating manager
    class AndroidRatingManager < Manager

      attr_reader :data_source, :database

      def self.build
        @app_package ||= ENV["ANDROID_APP_PACKAGE"]
        data_source = MobileKPI::DataSource::AndroidRating.new(@app_package)
        database = MobileKPI::Database.new
        self.new(data_source, database)
      end

      def initialize(data_source, database)
        @data_source = data_source
        @database = database
      end

      def work
        rating = @data_source.rating
        @database.store_rating(rating)
      end

    end
  end
end
