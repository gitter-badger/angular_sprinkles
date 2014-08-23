module AngularSprinkles
  module Mixins
    module JsTransformable
      def to_ctrl_variable(str)
        "#{AngularSprinkles::CONTROLLER_NAME}.#{str}"
      end

      def set_prototype_variable(key, value)
        or_equals_js(to_ctrl_prototype_variable(key), value)
      end

      def set_constructor_variable(key, value)
        "this.#{key} = #{value.to_json}"
      end

      private

      def or_equals_js(key, value)
        "#{key} = #{key} || #{value.to_json}";
      end

      def to_ctrl_prototype_variable(str)
        "#{AngularSprinkles::CONTROLLER_FN}.prototype.#{str}"
      end
    end
  end
end
