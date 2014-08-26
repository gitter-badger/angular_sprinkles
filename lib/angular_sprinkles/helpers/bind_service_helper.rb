require 'action_view/helpers'
require 'angular_sprinkles/mixins/cache'

module AngularSprinkles
  module Helpers
    module BindServiceHelper
      include ::ActionView::Helpers
      include Mixins::Cache

      def bind_service(service, *input)
        raise TypeError unless service.is_a?(Symbol) || service.is_a?(String)

        cache.yield_if_new(service) do |s|
          content_for(:sprinkles, content_tag(:script, "#{SERVICE_QUEUE}.push('#{s}')".html_safe))
        end

        "#{CONTROLLER_NAME}.#{service}(#{input.join(',')})".html_safe
      end

      private

      def cache
        self._sprinkles_cache
      end
    end
  end
end
