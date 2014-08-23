module AngularSprinkles
  module Mixins
    module Initializable
      def var_initialized?(variable)
        variable = [variable].flatten.compact
        initialized_variables[variable] or (initialized_variables[variable] = true) && false
      end

      private

      def initialized_variables
        @_sprinkles_initialized_variables ||= {}
      end
    end
  end
end
