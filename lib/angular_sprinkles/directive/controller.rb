module AngularSprinkles
  module Directive
    class Controller
      def initialize(args)
        @base = args.fetch(:base)
        @object_wrapper = args.fetch(:object_wrapper)
        @bind_json_wrapper = args.fetch(:bind_json_wrapper)
        @call_json_wrapper = args.fetch(:call_json_wrapper)
      end

      def bind(attribute = nil)
        @object_wrapper.new(@base, attribute, @bind_json_wrapper)
      end

      def call(function, *input)
        @object_wrapper.new(@base, function, input, @call_json_wrapper)
      end
    end
  end
end
