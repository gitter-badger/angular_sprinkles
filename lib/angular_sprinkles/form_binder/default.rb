module AngularSprinkles
  class FormBinder
    class Default < Base
      private

      def bind_to_model(params)
        args = params.fetch(:args)
        object = params.fetch(:object)
        method = params.fetch(:method)
        attribute = params.fetch(:attribute)

        # Assume that optional params default to {}
        # This is a safe assumption for all helpers except check_box
        (method.arity.abs - args.count).times { args.push({}) }

        # The last argument is always the one where ng-model should be appended
        args.last.merge!('ng-model' => object.bind(attribute))
      end
    end
  end
end
