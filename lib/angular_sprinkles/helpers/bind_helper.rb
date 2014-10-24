module AngularSprinkles
  module Helpers
    module BindHelper
      def ng_bind(*input)
        register_service = ObjectKeyWrapper.new(*input, JavaScript::RegisterVariable)
        @_sprinkles.content_yielder.call(register_service)

        ObjectKeyWrapper.new(*input, JavaScript::BindVariable)
      end
    end
  end
end
