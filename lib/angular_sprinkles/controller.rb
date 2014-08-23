require 'active_record'
require 'angular_sprinkles/mixins/js_transformable'
require 'angular_sprinkles/mixins/initializable'
require 'angular_sprinkles/decorators/bind_decorator'

module AngularSprinkles
  module Controller
    include AngularSprinkles::Mixins::JsTransformable
    include AngularSprinkles::Mixins::Initializable

    def bindable(object)
      object = object.to_a if object.is_a?(::ActiveRecord::Relation)
      key = object_key(object)
      assignable(key => object)
      AngularSprinkles::Decorators::Bind.new(object, key, method(:view_context))
    end

    def assignable(hash)
      raise TypeError unless hash.is_a?(Hash)
      preload_to_page(hash)
    end

    def view_context
      @_sprinkles_view_context ||= super.tap do |view|
        sprinkles_content.unshift(AngularSprinkles::CONSTRUCTOR_DEFINITION)
        content = view.content_tag(:script, (sprinkles_content.join(";\n") + ';').html_safe)
        view.content_for(:sprinkles, content)
      end
    end

    private

    def object_key(object)
      klass = object.class
      "#{klass}_#{inc_sprinkles_counter(klass)}"
    end

    def sprinkles_counter
      @_sprinkles_counter ||= {}
    end

    def inc_sprinkles_counter(klass)
      sprinkles_counter[klass] ||= 0
      sprinkles_counter[klass] += 1
    end

    def preload_to_page(hash)
      hash.each do |var_name, value|
        if !var_initialized?(var_name)
          str = set_prototype_variable(var_name, value)
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
