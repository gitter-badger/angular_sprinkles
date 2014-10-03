module AngularSprinkles
  module Mixins
    ##
    # OTHER_HELPERS_AND_ARGS
    #
    # - lists helper methods and their required arguments.
    #
    # - arguments named 'options' will be merged with { ng-model => @object.bind(method.to_sym) }
    #
    # - note that some arguments are named '_options' because some helpers have the 'options' and 'html_options' fields
    #     and, therefore, ng-model would be included as part of the 'html_options' instead of 'options'
    #
    OTHER_HELPERS_AND_ARGS = {
      check_box: 'method, options = {}, checked_value = "1", unchecked_value = "0"',
      radio_button: 'method, tag_value, options = {}',
      date_select: 'method, _options = {}, options = {}',
      time_select: 'method, _options = {}, options = {}',
      datetime_select: 'method, _options = {}, options = {}',
      select: 'method, choices = nil, _options = {}, options = {}, &block',
      collection_select: 'method, collection, value_method, text_method, _options = {}, options = {}',
      grouped_collection_select: 'method, collection, group_method, group_label_method, option_key_method, option_value_method, _options = {}, options = {}',
      time_zone_select: 'method, priority_zones = nil, _options = {}, options = {}',
      collection_check_boxes: 'method, collection, value_method, text_method, _options = {}, options = {}, &block',
      collection_radio_buttons: 'method, collection, value_method, text_method, _options = {}, options = {}, &block'
    }

    DEFAULT_ARGS = /
      \s* \= \s* (
        \{\} |
        \"0\" |
        \"1\"
      )
    /x

    ##
    # .helpers_and_args
    #
    # - completes the list of helpers bound with ng-model by using the ActionView::Helpers::Formbuilder.field_helpers constant
    #
    # - this list all have the same list of two arguments, method and options
    #
    def self.helpers_and_args
      (ActionView::Helpers::FormBuilder.field_helpers - [:label, :check_box, :radio_button, :fields_for]).reduce(OTHER_HELPERS_AND_ARGS) do |acc, field_helper|
        acc.merge(field_helper => 'method, options = {}')
      end
    end

    module FormBuilder
      AngularSprinkles::Mixins.helpers_and_args.each do |selector, args|
        class_eval <<-RUBY_EVAL, __FILE__, __LINE__ + 1
          def ng_#{selector}(#{args})
            options.merge!('ng-model' => @object.bind(method.to_sym))
            #{selector}(#{args.gsub(DEFUALT_ARGS, '')})
          end
        RUBY_EVAL
      end
    end
  end
end

ActionView::Helpers::FormBuilder.send(:include, AngularSprinkles::Mixins::FormBuilder)
