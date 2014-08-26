require 'angular_sprinkles/variable_cache'

module AngularSprinkles
  module Mixins
    module Cache
      def _sprinkles_cache
        @_sprinkles_cache ||= AngularSprinkles::VariableCache.new
      end
    end
  end
end
