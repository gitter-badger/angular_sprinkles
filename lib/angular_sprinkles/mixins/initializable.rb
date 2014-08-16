module AngularSprinkles
  module Mixins
    module Initializable
      def app_initialized?
        @_sprinkles_app_initialized or (@_sprinkles_app_initialized = true) && false
      end

      def var_initialized?(variable)
        initialized_variables[variable.to_s] or (initialized_variables[variable.to_s] = true) && false
      end

      private

      def initialized_variables
        @_sprinkles_initialized_variables ||= {}
      end
    end
  end
end
