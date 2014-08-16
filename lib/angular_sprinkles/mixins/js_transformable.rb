module AngularSprinkles
  module Mixins
    module JsTransformable
      def to_ctrl_prototype_variable(str)
        "#{AngularSprinkles::CONTROLLER_FN}.prototype.#{str}"
      end

      def to_ctrl_variable(str)
        "#{AngularSprinkles::CONTROLLER_NAME}.#{str}"
      end

      def or_equals_js(key, value)
        "#{key} = #{key} || #{value.to_json}";
      end
    end
  end
end
