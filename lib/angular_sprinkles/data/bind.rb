require 'angular_sprinkles/mixins/js_transformable'

module AngularSprinkles
  module Data
    class Bind
      include Mixins::JsTransformable

      def initialize(*strs)
        @strs = strs
      end

      def to_json
        to_ctrl_variable(@strs.join('.'))
      end
      alias_method :to_s, :to_json
    end
  end
end
