module MobileKPI
  module Manager
    # Jobs base class
    class Manager
      def work
        raise 'Override this'
      end
    end
  end
end