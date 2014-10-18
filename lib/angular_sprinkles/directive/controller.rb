module AngularSprinkles
  module Directive
    class Controller
      def initialize(args)
        @name = args.fetch(:name)
        @object_wrapper = args.fetch(:object_wrapper)
        @bind_json_wrapper = args.fetch(:bind_json_wrapper)
        @call_json_wrapper = args.fetch(:call_json_wrapper)
      end

      def bind(attribute = nil)
        @object_wrapper.new(@name, attribute, @bind_json_wrapper)
      end

      def call(function, *input)
        @object_wrapper.new(@name, function, input, @call_json_wrapper)
      end
    end
  end
end
