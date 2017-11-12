module MobileKPI
  # App rating representation
  module Entity
    # App Rating
    class Rating
      attr_accessor :platform, :name, :bundle_identifier, :version, :rating, :rating_count

      def initialize(platform: nil, name: nil, bundle_identifier: nil, version: nil, rating: nil, rating_count: nil)
        @platform = platform
        @name = name
        @bundle_identifier = bundle_identifier
        @version = version
        @rating = rating
        @rating_count = rating_count
      end

      def to_hash
        {
            platform: @platform,
            name: @name,
            bundle_identifier: @bundle_identifier,
            version: @version,
            rating: @rating,
            rating_count: @rating_count
        }
      end
    end
  end
end
