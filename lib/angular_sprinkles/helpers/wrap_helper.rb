module AngularSprinkles
  module Helpers
    module WrapHelper
      def ng_wrap(name, &block)
        scope = Element::Scope.new({
          base: name,
          object_wrapper: ObjectKeyWrapper,
          bind_json_wrapper: JavaScript::NoOp,
          call_json_wrapper: JavaScript::BindService
        })

        capture(scope, &block)
      end
    end
  end
end
