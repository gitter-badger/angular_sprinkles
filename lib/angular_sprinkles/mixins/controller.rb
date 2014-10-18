module AngularSprinkles
  module Mixins
    module Controller
      def initialize(*args)
        key_generator = KeyGenerator.new({
          counter: Counter.new,
          cache: Cache.new
        })

        constructor_collection = ConstructorCollection.new({
          json_wrapper: JavaScript::ConstructorThis,
          object_wrapper: ObjectKeyWrapper
        })

        constructor = Constructor.new({
          json_wrapper: JavaScript::ConstructorWrapper,
          collection: constructor_collection
        })

        @_sprinkles = Context.new({
          key_generator: key_generator,
          constructor: constructor,
          constructor_collection: constructor_collection
        })

        super
      end

      def bindable(object)
        object = object.to_a if object.is_a?(::ActiveRecord::Relation)
        object.map!(&method(:bindable)) if object.is_a?(Array)
        key = @_sprinkles.key_generator.call(object)
        @_sprinkles.constructor_collection.push(object, key)
        ModelDecorator.new({
          object: object,
          key: key,
          json_wrapper: JavaScript::BindVariable,
          object_wrapper: ObjectKeyWrapper
        })
      end

      def view_context
        super.tap do |context|
          @_sprinkles.content_yielder = ContentYielder.new({
            cache: Cache.new,
            context: context,
            yield_to: JavaScript::PREFIX
          })
          @_sprinkles.content_yielder.call(@_sprinkles.constructor)
        end
      end
    end
  end
end
