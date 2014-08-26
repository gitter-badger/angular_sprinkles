require 'action_view/helpers'
require 'angular_sprinkles/mixins/initializable'

module AngularSprinkles
  module Helpers
    module BindServiceHelper
      include ::ActionView::Helpers
      include Mixins::Initializable

      def bind_service(service, *input)
        raise TypeError unless service.is_a?(Symbol) || service.is_a?(String)

        yield_to_sprinkles("#{SERVICE_QUEUE}.push('#{service}')") unless var_initialized?(service)

        "#{CONTROLLER_NAME}.#{service}(#{input.join(',')})".html_safe
      end

      private

      def yield_to_sprinkles(content)
        content_for(:sprinkles) do
          content_tag(:script, content.html_safe)
        end
      end
    end
  end
end
