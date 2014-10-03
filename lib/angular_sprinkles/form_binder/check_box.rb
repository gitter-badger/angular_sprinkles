module AngularSprinkles
  class FormBinder
    class CheckBox < Base
      private

      def bind_to_model(params)
        args = params.fetch(:args)
        object = params.fetch(:object)
        attribute = params.fetch(:attribute)

        if args.many?
          args.second.merge!('ng-model' => object.bind(attribute))
        end
      end
    end
  end
end
