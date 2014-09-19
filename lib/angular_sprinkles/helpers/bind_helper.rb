module AngularSprinkles
  module Helpers
    module BindHelper
      def bind(*input)
        camelized = input.map(&:to_s).map { |i| i.camelize(:lower) }

        register_service = ObjectKeyWrapper.new(*camelized, JavaScript::RegisterVariable)
        @_sprinkles.content_yielder.call(register_service)

        ObjectKeyWrapper.new(*camelized, JavaScript::BindVariable)
      end
    end
  end
end
