module AngularSprinkles
  class FormBinder
    class Default < Base
      private

      def bind_to_model(params)
        args = params.fetch(:args)
        method = params.fetch(:method)

        # Assume that optional params default to {}
        # This is a safe assumption for all helpers except check_box
        (method.arity.abs - args.count).times { args.push({}) }

        # The last argument is always the one where ng-model should be appended
        args.last.reverse_merge!('ng-model' => params.fetch(:attribute_binding))
      end
    end
  end
end
