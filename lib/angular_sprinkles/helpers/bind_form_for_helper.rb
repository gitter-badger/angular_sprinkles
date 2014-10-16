module AngularSprinkles
  module Helpers
    module BindFormForHelper

      ##
      # bind_form_for
      #
      # Wraps the form_for helper so that form submission can be bound
      # an Angular service function. Accepts an additional argument which
      # is the name of a service. Two arguments are passed to the service:
      # the object and the Angular representation of the form.
      def bind_form_for(record, submit_callback, options = {}, &block)
        form_name = ObjectKeyWrapper.new('form', JavaScript::NoOp)
        record_array = [record].flatten # ensures that record will be handled in the same way whether or not it's an array

        html_options = {
          'name' => form_name,
          'ng-submit' => service(submit_callback, *record_array.map(&:bind), form_name)
        }.merge(options[:html] || {})

        augmented_options = options.merge(url: "", method: "", html: html_options)

        form_for(record_array.first, augmented_options, &block).gsub('action="" ', '').html_safe
      end
    end
  end
end
