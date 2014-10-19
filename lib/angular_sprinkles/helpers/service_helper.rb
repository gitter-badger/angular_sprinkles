module AngularSprinkles
  module Helpers
    module ServiceHelper
      def service(name, *input)
        register_service = ObjectKeyWrapper.new(name, JavaScript::RegisterService)
        @_sprinkles.content_yielder.call(register_service)

        ObjectKeyWrapper.new(name, input, JavaScript::BindRootService)
      end
    end
  end
end
