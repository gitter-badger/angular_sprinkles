module AngularSprinkles
  module Helpers
    module ElementHelper
      def _ng_element(opts = {}, &block)
        options = opts.dup.symbolize_keys

        scope_name = options.delete(:scope_name)
        html_options = options.delete(:html) || {}
        input_options = options # use remaining options

        content = ng_wrap(scope_name, &block) if block_given?

        input = Element::Input.new(input_options)
        html = Element::Html.new(html_options)

        attributes = Element::Attributes.new([input, html], tag: html.tag, content: content)

        content_tag(*attributes.to_content_tag)
      end
    end
  end
end
