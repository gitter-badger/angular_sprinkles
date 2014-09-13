module AngularSprinkles
  module Helpers
    module DirectiveHelper
      def directive(name, input = {}, options = {}, &block)
        content = capture(&block) if block_given?

        attributes = Directive::Attributes.new([
          Directive::Name.new(name),
          Directive::Input.new(input),
          Directive::Options.new(options.except(:tag))
        ], { tag: options[:tag], content: content })

        content_tag(*attributes.to_content_tag)
      end
    end
  end
end
