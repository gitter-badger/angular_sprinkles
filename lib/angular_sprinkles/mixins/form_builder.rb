module AngularSprinkles
  module Mixins
    DEFAULT_HELPERS = ActionView::Helpers::FormBuilder.field_helpers - [:label, :fields_for]
    # DATE_HELPERS = [:date_select, :time_select, :datetime_select]
    # SELECT_HELPERS = [:select, :collection_select, :grouped_collection_select, :time_zone_select, :collection_check_boxes, :collection_radio_buttons]
    # ALL_HELPERS = [*DATE_HELPERS, *SELECT_HELPERS, *DEFAULT_HELPERS]

    module FormBuilder
      DEFAULT_HELPERS.each do |helper|
        class_eval <<-RUBY_EVAL, __FILE__, __LINE__ + 1
          def bind_#{helper}(*args, &block)
            params = { helper: :#{helper}, method: method(:#{helper}), args: args, object: @object }
            args_with_binding = AngularSprinkles::FormBinder.new(params).call
            #{helper}(*args_with_binding, &block)
          end
        RUBY_EVAL
      end
    end
  end
end
