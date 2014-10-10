module AngularSprinkles
  class FormBinder
    class CheckBox < Base
      private

      def augment_args
        @args.tap do |args|
          args.second.reverse_merge!({ "ng-model" => @attribute_binding })
        end
      end
    end
  end
end
