module MobileKPI
  module Job
    # Jobs base class
    class Job
      def trigger
        raise "Override this"
      end
    end
  end
end