module AngularSprinkles
  module Mixins
    module FormBuilder
      def bind(helper, *args)
        params = { helper: helper, method: method(helper), args: args, object: @object }

        AngularSprinkles::FormBinder.new(params).call
      end
    end
  end
end
