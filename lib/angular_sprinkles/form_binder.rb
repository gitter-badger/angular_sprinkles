module AngularSprinkles
  class FormBinder
    def initialize(args)
      @method = args.fetch(:method)
      @args = args.fetch(:args).dup
      @object = args.fetch(:object)
      @attribute = @args.first.to_sym
    end

    def call
      if helper_is_going_raise_argument_error?
        # Let the original form helper raise the exception
        return @method.call(*@args)
      end

      # Assume that optional params default to {}
      # This is a safe assumption for all helpers except check_box
      optional_args_not_used.times { @args.push({}) }

      # The last argument is always the one where ng-model should be appended
      @args.last.merge!('ng-model' => @object.bind(@attribute))

      @method.call(*@args)
    end

    private

    def helper_is_going_raise_argument_error?
      @args.count < required_parameters.count
    end

    def required_parameters
      @method.parameters.select { |i| i.first == :req }
    end

    def optional_args_not_used
      @method.arity.abs - @args.count
    end
  end
end
