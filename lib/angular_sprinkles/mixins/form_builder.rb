module AngularSprinkles
  module Mixins
    # check_box: 'method, options = {}, checked_value = "1", unchecked_value = "0"',

    module FormBuilder
      def bind(helper, *args)
        case helper
        when :check_box
          # do something with checkbox
        else
          AngularSprinkles::FormBinder.new({ method: method(helper), args: args, object: @object }).call
        end
      end
    end
  end
end

ActionView::Helpers::FormBuilder.send(:include, AngularSprinkles::Mixins::FormBuilder)
