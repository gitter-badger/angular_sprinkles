require 'action_view/helpers'

module AngularSprinkles
  module Helpers
    module DirectiveHelper
      include ::ActionView::Helpers

      def directive(name, input = {}, options = {}, &block)
        raise TypeError unless [String, Symbol, Array].include?(name.class)
        raise TypeError unless input.is_a?(Hash)
        raise TypeError unless options.is_a?(Hash)

        input.symbolize_keys!
        options.symbolize_keys!

        tag_contents = block_given? ? capture(&block) : ''
        tag_attributes = {}
        tag_name = options[:tag] || :div

        directive_attributes = Hash[input.map { |k, v| [k, v.to_json] }]
        name_attributes = Hash[[name].flatten.product([''])]

        tag_attributes[:data] = [directive_attributes, name_attributes].compact.inject(&:merge)
        tag_attributes.merge!(options.slice(:class, :style))

        content_tag(tag_name, tag_contents, tag_attributes)
      end
    end
  end
end
