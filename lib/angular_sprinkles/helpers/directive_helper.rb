module AngularSprinkles
  module Helpers
    module DirectiveHelper
      def directive(directive_name, options = {}, &block)
        content = capture(&block) if block_given?

        name = Directive::Name.new(directive_name)
        input = Directive::Input.new(options.except(:html))
        html = Directive::Html.new(options[:html])

        attributes = Directive::Attributes.new([name, input, html], tag: html.tag, content: content)

        content_tag(*attributes.to_content_tag)
      end
    end
  end
end
