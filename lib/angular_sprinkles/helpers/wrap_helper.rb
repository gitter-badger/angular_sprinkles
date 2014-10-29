module AngularSprinkles
  module Helpers
    module WrapHelper
      def ng_wrap(*names, &block)
        scopes = names.map do |name|
          Element::Scope.new({
            base: name,
            object_wrapper: ObjectKeyWrapper,
            bind_json_wrapper: JavaScript::NoOp,
            call_json_wrapper: JavaScript::BindService
          })
        end

        capture(*scopes, &block)
      end
    end
  end
end
