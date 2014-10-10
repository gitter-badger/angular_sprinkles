module AngularSprinkles
  class FormBinder
    class CheckBox < Base
      private

      def augment_args
        binding = { "ng-model" => @attribute_binding }

        @args.tap do |args|
          if args.many?
            args.second.reverse_merge!(binding)
          else
            args.push(binding)
          end
        end
      end
    end
  end
end
