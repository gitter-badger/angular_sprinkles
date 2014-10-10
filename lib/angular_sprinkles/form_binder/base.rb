module AngularSprinkles
  class FormBinder
    class Base
      def initialize(_args)
        @method = _args.fetch(:method)
        @args = _args.fetch(:args).dup

        object = _args.fetch(:object)
        attribute = @args.first.to_sym

        @attribute_binding = object.bind(attribute)
      end

      def call
        # Let the original form helper raise the exception
        if helper_is_going_raise_argument_error?
          return @args
        end

        args_with_binding
      end

      private

      def args_with_binding; raise NotImplementedError; end

      def helper_is_going_raise_argument_error?
        @args.count < required_parameters.count
      end

      def required_parameters
        @method.parameters.select { |i| i.first == :req }
      end
    end
  end
end
