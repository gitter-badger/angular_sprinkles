module AngularSprinkles
  module Directive
    class Html
      def initialize(args)
        @args = args.symbolize_keys
      end

      def attributes
        @args.except(:tag)
      end

      def tag
        @args[:tag] || :div
      end
    end
  end
end
