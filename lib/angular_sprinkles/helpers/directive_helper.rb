module AngularSprinkles
  module Helpers
    module DirectiveHelper
      def directive(directive_name, options = {}, &block)
        if block_given?
          scope = Element::Scope.new({
            base: "#{directive_name}Ctrl",
            object_wrapper: ObjectKeyWrapper,
            bind_json_wrapper: JavaScript::NoOp,
            call_json_wrapper: JavaScript::BindService
          })

          content = capture(scope, &block)
        end

        name = Element::Name.new(directive_name)
        input = Element::Input.new(options.except(:html))
        html = Element::Html.new(options[:html])

        attributes = Element::Attributes.new([name, input, html], tag: html.tag, content: content)

        content_tag(*attributes.to_content_tag)
      end
    end
  end
end
