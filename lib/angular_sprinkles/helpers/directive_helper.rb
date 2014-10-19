module AngularSprinkles
  module Helpers
    module DirectiveHelper
      def directive(directive_name, options = {}, &block)
        if block_given?
          controller = Directive::Controller.new({
            name: "#{directive_name}Ctrl",
            object_wrapper: ObjectKeyWrapper,
            bind_json_wrapper: JavaScript::NoOp,
            call_json_wrapper: JavaScript::BindService
          })

          content = capture(controller, &block)
        end

        name = Directive::Name.new(directive_name)
        input = Directive::Input.new(options.except(:html))
        html = Directive::Html.new(options[:html])

        attributes = Directive::Attributes.new([name, input, html], tag: html.tag, content: content)

        content_tag(*attributes.to_content_tag)
      end
    end
  end
end
