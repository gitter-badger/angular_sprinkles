module AngularSprinkles
  module Directive
    class Options
      def initialize(args)
        @args = args.symbolize_keys
      end

      def attributes
        @args
      end
    end
  end
end
