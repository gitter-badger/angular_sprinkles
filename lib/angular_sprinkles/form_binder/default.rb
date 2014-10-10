module AngularSprinkles
  class FormBinder
    class Default < Base
      private

      def args_with_binding
        binding = { "ng-model" => @attribute_binding }

        @args.tap do |args|
          # Assume that optional params default to {}
          # This is a safe assumption for all helpers except check_box
          (@method.arity.abs - args.count).times { args.push({}) }

          # The last argument is always the one where ng-model should be appended
          args.last.reverse_merge!(binding)
        end
      end
    end
  end
end
