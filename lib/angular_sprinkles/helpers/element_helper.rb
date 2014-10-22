module AngularSprinkles
  module Helpers
    module ElementHelper
      def _element(opts = {}, &block)
        options = opts.dup.symbolize_keys

        scope_name = options.delete(:scope_name)
        html_options = options.delete(:html) || {}
        input_options = options # use remaining options

        if block_given?
          scope = Element::Scope.new({
            base: scope_name,
            object_wrapper: ObjectKeyWrapper,
            bind_json_wrapper: JavaScript::NoOp,
            call_json_wrapper: JavaScript::BindService
          })

          content = capture(scope, &block)
        end

        input = Element::Input.new(input_options)
        html = Element::Html.new(html_options)

        attributes = Element::Attributes.new([input, html], tag: html.tag, content: content)

        content_tag(*attributes.to_content_tag)
      end
    end
  end
end
