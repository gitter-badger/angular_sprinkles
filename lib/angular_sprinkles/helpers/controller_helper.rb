module AngularSprinkles
  module Helpers
    module ControllerHelper
      def ctrl(controller_name, opts = {}, &block)
        options = opts.dup.symbolize_keys

        options['ng-controller'] = "#{controller_name} as #{controller_name}"
        options[:scope_name] ||= controller_name
        _element(options, &block)
      end
    end
  end
end
