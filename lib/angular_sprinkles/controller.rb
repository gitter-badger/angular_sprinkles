require 'active_record'
require 'angular_sprinkles/mixins/js_transformable'
require 'angular_sprinkles/mixins/cache'
require 'angular_sprinkles/decorators/bind_decorator'

module AngularSprinkles
  module Controller
    include AngularSprinkles::Mixins::JsTransformable
    include AngularSprinkles::Mixins::Cache

    def bindable(object)
      object = object.to_a if object.is_a?(::ActiveRecord::Relation)
      key = object_key(object)

      if object.is_a?(Array)
        # TODO: Give me some love
        object.map!(&method(:bindable))
        constructor_keys = object.map { |o| "this.#{o.bind_key}" }
        sprinkles_constructor.push("this.#{key} = [#{constructor_keys.join(',')}]")
      else
        add_to_constructor(key => object)
      end

      AngularSprinkles::Decorators::Bind.new(object, key, method(:view_context))
    end

    def add_to_constructor(hash)
      raise TypeError unless hash.is_a?(Hash)
      hash.each do |var_name, value|
        _sprinkles_cache.yield_if_new(var_name) do |var|
          str = set_constructor_variable(var, value)
          sprinkles_constructor.push(str)
        end
      end
      sprinkles_constructor
    end

    def view_context
      @_sprinkles_view_context ||= super.tap do |view|
        constructor = constructor_wrapper(sprinkles_constructor).gsub(/^\s+/, "")
        content = view.content_tag(:script, constructor.html_safe)
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

    def sprinkles_constructor
      @_sprinkles_constructor ||= []
    end

    def constructor_wrapper(assignments)
      <<-WRAPPER
        #{CONTROLLER_FN} = #{CONTROLLER_FN} || function ($injector) {
          #{assignments.join(";\n") + ";"}

          #{SERVICE_QUEUE}.forEach(function (service) {
            this[service] = $injector.get(service);
          }.bind(this));
        };
        #{SERVICE_QUEUE} = [];
      WRAPPER
    end
  end
end
