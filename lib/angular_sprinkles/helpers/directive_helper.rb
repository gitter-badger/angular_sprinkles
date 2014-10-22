module AngularSprinkles
  module Helpers
    module DirectiveHelper
      def directive(directive_name, opts = {}, &block)
        options = opts.dup.symbolize_keys

        options[directive_name] = ""
        options[:scope_name] ||= "#{directive_name}Ctrl"
        _element(options, &block)
      end
    end
  end
end
