module AngularSprinkles
  module Helpers
    module DirectiveHelper
      def ng_directive(directive_name, opts = {}, &block)
        options = opts.dup.symbolize_keys

        options[directive_name] = ""
        options[:scope_name] ||= "#{directive_name}Ctrl"
        _ng_element(options, &block)
      end
    end
  end
end
