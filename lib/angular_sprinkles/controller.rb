require 'angular_sprinkles/mixins/js_transformable'
require 'angular_sprinkles/mixins/initializable'

module AngularSprinkles
  module Controller
    include AngularSprinkles::Mixins::JsTransformable
    include AngularSprinkles::Mixins::Initializable

    def bindable(hash)
      raise TypeError unless hash.is_a?(Hash)
      declare_js_controller_prototype unless app_initialized?
      preload_to_page(hash)
    end

    def view_context
      @_sprinkles_view_context ||= super.tap do |view|
        if sprinkles_content.any?
          content = view.content_tag(:script, (sprinkles_content.join(";\n") + ';').html_safe)
          view.content_for(:sprinkles, content)
        end
      end
    end

    private

    def declare_js_controller_prototype
      sprinkles_content.push(AngularSprinkles::CONSTRUCTOR_DEFINITION)
    end

    def preload_to_page(hash)
      hash.each do |var_name, value|
        if !var_initialized?(var_name)
          prototype = to_ctrl_prototype_variable(var_name)
          str = or_equals_js(prototype, value)
          sprinkles_content.push(str)
        end
      end
      sprinkles_content
    end

    def sprinkles_content
      @_sprinkles_content ||= []
    end
  end
end
