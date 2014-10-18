module AngularSprinkles
  module Helpers
    module ServiceHelper
      def service(name, *input)
        camelized = name.to_s.camelize(:lower)

        register_service = ObjectKeyWrapper.new(camelized, JavaScript::RegisterService)
        @_sprinkles.content_yielder.call(register_service)

        ObjectKeyWrapper.new(camelized, input, JavaScript::BindRootService)
      end
    end
  end
end
