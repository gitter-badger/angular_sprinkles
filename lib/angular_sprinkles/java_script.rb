module AngularSprinkles
  module JavaScript
    PREFIX = :sprinkles
    APP_NAME = "#{PREFIX}App"
    CONTROLLER_NAME = "#{PREFIX}Ctrl"
    CONTROLLER_FN = "window.#{CONTROLLER_NAME}Fn"
    SERVICE_QUEUE = "#{CONTROLLER_FN}.serviceQueue"

    PLUGIN = <<-BlockOfJavaScript
    (function (window, document, angular) {
      window.sprinkles = angular.module('#{APP_NAME}', []);
      window.onload = function () {
        var queue,
          app = angular.module('#{APP_NAME}'),
          doc = document.documentElement,
          ctrlName = 'Ctrl';
        #{CONTROLLER_FN} = #{CONTROLLER_FN} || function(){};
        app.controller(ctrlName, #{CONTROLLER_FN});
        doc.setAttribute('data-ng-controller', ctrlName + ' as #{CONTROLLER_NAME}');
        angular.bootstrap(doc, [app.name]);
      };
    }(window, document, window.angular));
    BlockOfJavaScript

    ConstructorWrapper = ->(string) do
      <<-BlockOfJavaScript
      #{CONTROLLER_FN} = #{CONTROLLER_FN} || function ($injector) {
        #{string}

        #{SERVICE_QUEUE}.forEach(function (service) {
          this[service] = $injector.get(service);
        }.bind(this));
        #{SERVICE_QUEUE} = [];
      };
      #{SERVICE_QUEUE} = [];
      BlockOfJavaScript
    end

    ConstructorThis = ->(object, key) do
      "this.#{key} = #{object.to_json};"
    end

    RegisterService = ->(method) do
      "#{SERVICE_QUEUE}.push('#{method}')"
    end

    BindService = ->(method, input) do
      "#{CONTROLLER_NAME}.#{method}(#{input.join(',')})"
    end

    BindVariable = ->(key, attribute) do
      [CONTROLLER_NAME, key, attribute].flatten.compact.join('.')
    end
  end
end
