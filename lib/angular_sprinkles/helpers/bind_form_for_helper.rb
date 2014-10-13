require 'byebug'

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
        form_name = ObjectKeyWrapper.new(
          @_sprinkles.key_generator.call(AngularSprinkles::Form.new),
          JavaScript::NoOp
        )

        html_options = {
          'name' => form_name,
          'ng-submit' => service(submit_callback, record.bind, form_name)
        }.merge(options[:html] || {})

        augmented_options = options.merge(url: "", method: "", html: html_options)

        form_for(record, augmented_options, &block)
      end
    end
  end

  private

  ##
  # AngularSprinkles::Form
  #
  # An empty placeholder class to be used by KeyGenerator when adding
  # the form_name attribute in AngularSprinkles::Helpers::BindFormForHelper
  class Form; end
end
