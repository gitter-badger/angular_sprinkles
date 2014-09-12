require 'rails'

module AngularSprinkles
  class Railtie < ::Rails::Railtie
    initializer "angular_sprinkles.setup_view_helpers" do
      ActiveSupport.on_load(:action_view) do
        include ::AngularSprinkles::Helpers
      end
    end
  end
end
