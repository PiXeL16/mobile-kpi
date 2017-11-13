module MobileKPI
  # Entity representations
  module Entity
    # Out of memory free sessions returned from Fabric
    class OOMFreeSessions
      attr_accessor :platform, :name, :bundle_identifier, :oom_free_sessions, :from, :to

      def initialize(platform: nil, name: nil, bundle_identifier: nil, oom_free_sessions: nil, from: nil, to: nil)
        @platform = platform
        @name = name
        @bundle_identifier = bundle_identifier
        @oom_free_sessions = oom_free_sessions
        @from = from
        @to = to
      end

      def to_hash
        {
            platform: @platform,
            name: @name,
            bundle_identifier: @bundle_identifier,
            oom_free_sessions: @oom_free_sessions,
            from: @from,
            to: @to
        }
      end
    end
  end
end
