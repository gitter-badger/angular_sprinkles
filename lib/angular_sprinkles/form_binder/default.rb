module AngularSprinkles
  class FormBinder
    class Default < Base
      private

      def augment_args
        binding = { "ng-model" => @attribute_binding }

        @args.tap do |args|
          # Assume that optional params default to {}
          # This is a safe assumption for all helpers except check_box
          (non_block_parameter_count - args.count).times { args.push({}) }

          # The last argument is always the one where ng-model should be appended
          args.last.reverse_merge!(binding)
        end
      end

      def non_block_parameter_count
        @method.parameters.count { |parameter| parameter.first != :block }
      end
    end
  end
end
