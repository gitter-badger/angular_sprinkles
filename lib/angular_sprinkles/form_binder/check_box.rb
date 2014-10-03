module AngularSprinkles
  class FormBinder
    class CheckBox < Base
      private

      def bind_to_model(params)
        args = params.fetch(:args)
        binding = { 'ng-model' => params.fetch(:attribute_binding) }

        if args.many?
          args.second.merge!(binding)
        else
          args.push(binding)
        end
      end
    end
  end
end
