module AngularSprinkles
  module Helpers
    module ServiceHelper
      def service(service, *input)
        camelized = service.to_s.camelize(:lower)

        register_service = ObjectKeyWrapper.new(camelized, JavaScript::RegisterService)
        @_sprinkles.content_yielder.call(register_service)

        ObjectKeyWrapper.new(camelized, input, JavaScript::BindService)
      end
    end
  end
end
