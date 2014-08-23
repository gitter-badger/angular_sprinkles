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
        input = input.flatten.compact

        raise ArgumentError if input.empty?

        yield_to_sprinkles(AngularSprinkles::CONSTRUCTOR_DEFINITION) unless app_initialized?

        build_chain(input).
          select(&method(:is_uninitialized?)).
          map(&method(:convert_to_empty_js_object_string)).
          tap(&method(:yield_if_any))

        AngularSprinkles::Data::Bind.new(*input)
      end

      private

      def build_chain(input)
        # [:a, :b, :c, :d] => [[:a], [:a, :b], [:a, :b, :c]]
        (1...input.count).inject([]) { |acc,i| acc << input.first(i) }
      end

      def is_uninitialized?(var)
        !var_initialized?(var)
      end

      def convert_to_empty_js_object_string(var)
        set_prototype_variable(var.join('.'), {})
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
