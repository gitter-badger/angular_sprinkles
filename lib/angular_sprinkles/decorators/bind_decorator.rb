module AngularSprinkles
  module Decorators
    class Bind < SimpleDelegator
      def initialize(object, key, context_proc)
        @_sprinkles_bind_wrapper = Wrapper.new(object, key, context_proc)
        super(object)
      end

      def bind(_method = nil)
        @_sprinkles_bind_wrapper.bind(_method)
      end

      def bind_key
        @_sprinkles_bind_wrapper.key
      end

      private

      class Wrapper
        # create BindWrapper so that methods and variables don't pollute
        # the object being wrapped by Bind

        attr_reader :object, :key, :context_proc

        def initialize(object, key, context_proc)
          @object, @key, @context_proc = object, key, context_proc
        end

        def bind(_method = nil)
          cache.yield_if_new([key, _method]) do |var|
            set_prototype_variable_and_yield(_method) unless _method.nil?
          end

          context.bind(key, _method)
        end

        private

        def context
          context_proc.call
        end

        def cache
          context._sprinkles_cache
        end

        def set_prototype_variable_and_yield(_method)
          var = [key, _method].join('.')
          str = context.set_prototype_variable(var, object.send(_method))
          yield_to_sprinkles("#{str};")
        end

        def yield_to_sprinkles(content)
          context.content_for(:sprinkles) do
            context.content_tag(:script, content.html_safe)
          end
        end
      end
    end
  end
end
