module AngularSprinkles
  module Mixins
    module Initializable
      def app_initialized?
        @_sprinkles_app_initialized or (@_sprinkles_app_initialized = true) && false
      end

      def var_initialized?(variable)
        variable = [variable].flatten
        initialized_variables[variable] or (initialized_variables[variable] = true) && false
      end

      private

      def initialized_variables
        @_sprinkles_initialized_variables ||= {}
      end
    end
  end
end
