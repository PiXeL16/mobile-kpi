module MobileKPI
  # App rating representation
  module Entity
    # App Rating
    class AppRating
      attr_accessor :platform, :name, :version, :rating, :rating_count

      def initialize(platform: nil, name: nil, version: nil, rating: nil, rating_count: nil)
        @platform = platform
        @name = name
        @version = version
        @rating = rating
        @rating_count = rating_count
      end

      def to_hash
        {
            platform: @platform,
            name: @name,
            version: @version,
            rating: @rating,
            rating_count: @rating_count
        }
      end
    end
  end
end
