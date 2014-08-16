module AngularSprinkles
  PREFIX = 'sprinkles'
  APP_NAME = "#{PREFIX}App"
  CONTROLLER_NAME = "#{PREFIX}Ctrl"
  CONTROLLER_FN = "window.#{CONTROLLER_NAME}Fn"
  CONSTRUCTOR_DEFINITION = "#{CONTROLLER_FN} = #{CONTROLLER_FN} || function(){};"
end

require 'angular_sprinkles/controller'
require 'angular_sprinkles/helpers'
require 'angular_sprinkles/engine'
require 'angular_sprinkles/railtie'
