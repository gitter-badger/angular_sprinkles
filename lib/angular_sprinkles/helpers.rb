require 'angular_sprinkles/helpers/bind_helper'
require 'angular_sprinkles/helpers/bind_service_helper'
require 'angular_sprinkles/helpers/directive_helper'

module AngularSprinkles
  module Helpers
    include Helpers::BindHelper
    include Helpers::BindServiceHelper
    include Helpers::DirectiveHelper
  end
end
