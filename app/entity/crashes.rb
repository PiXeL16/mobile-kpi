module MobileKPI
  # App rating representation
  module Entity
    # Total crashes for an app in a period of time
    class Crashes
      attr_accessor :platform, :name, :bundle_identifier, :crashes_count, :from, :to

      def initialize(platform: nil, name: nil, bundle_identifier: nil, crashes_count: nil, from: nil, to: nil)
        @platform = platform
        @name = name
        @bundle_identifier = bundle_identifier
        @crashes_count = crashes_count
        @from = from
        @to = to
      end

      def to_hash
        {
            platform: @platform,
            name: @name,
            bundle_identifier: @bundle_identifier,
            crashes_count: @crashes_count,
            from: @from,
            to: @to
        }
      end
    end
  end
end
