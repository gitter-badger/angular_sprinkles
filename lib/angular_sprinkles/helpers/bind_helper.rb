require 'action_view/helpers'
require 'angular_sprinkles/mixins/js_transformable'
require 'angular_sprinkles/mixins/initializable'
require 'angular_sprinkles/data/bind'

module AngularSprinkles
  module Helpers
    module BindHelper
      include ::ActionView::Helpers
      include Mixins::JsTransformable
      include Mixins::Initializable

      def bind(*input)
        input = input.flatten

        yield_to_sprinkles(AngularSprinkles::CONSTRUCTOR_DEFINITION) unless app_initialized?

        case input.count
        when 0
          raise ArgumentError
        when 1
          AngularSprinkles::Data::Bind.new(input.first)
        else
          first = input.shift
          last = input.pop

          chain = input.inject([first]) do |arr, var|
            arr.push("#{arr.last}.#{var}")
          end

          chain.
            select(&method(:is_uninitialized?)).
            map(&method(:convert_to_empty_js_object_string)).
            tap(&method(:yield_if_any))

          AngularSprinkles::Data::Bind.new(chain.last, last)
        end
      end

      private

      def is_uninitialized?(var)
        !var_initialized?(var)
      end

      def convert_to_empty_js_object_string(var)
        or_equals_js(to_ctrl_prototype_variable(var), {})
      end

      def yield_if_any(chain)
        yield_to_sprinkles(chain.join(";\n") + ';') if chain.any?
      end

      def yield_to_sprinkles(content)
        content_for(:sprinkles) do
          content_tag(:script, content.html_safe)
        end
      end

    end
  end
end
