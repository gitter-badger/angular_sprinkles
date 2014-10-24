module AngularSprinkles
  module Helpers
    module IsolateHelper
      def ng_isolate(opts = {}, &block)
        controller_name = "isolate_#{SecureRandom.hex}"
        isolate_controller = ObjectKeyWrapper.new(controller_name, JavaScript::IsolateController)

        @_sprinkles.content_yielder.call(isolate_controller)
        ng_controller(controller_name, opts, &block)
      end
    end
  end
end
