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
        app.config(['$httpProvider', function ($httpProvider) {
          var csrfToken = document.querySelector('meta[name=csrf-token]');
          if (csrfToken) {
            $httpProvider.defaults.headers.common['X-CSRF-Token'] = csrfToken.content;
          }
        }]);
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

    ControllerPrototypeVariable = ->(*args) do
      "#{CONTROLLER_FN}.prototype.#{args.join('.')}"
    end

    RegisterService = ->(method) do
      "#{SERVICE_QUEUE}.push('#{method}')"
    end

    BindRootService = ->(*args) do
      BindService.call(CONTROLLER_NAME, *args)
    end

    BindService = ->(controller_name, method, input) do
      "#{controller_name}.#{method}(#{input.map(&:to_json).join(',')})"
    end

    RegisterVariable = ->(*args) do
      args.pop

      acc, _ = args.inject(['', []]) do |(acc, store), arg|
        store.push(arg)
        prototype = ControllerPrototypeVariable.call(store)
        acc += "#{prototype} = #{prototype} || {};\n"
        [acc, store]
      end

      acc
    end

    BindVariable = ->(*args) do
      NoOp.call(*[CONTROLLER_NAME, *args])
    end

    NoOp = ->(*args) do
      args.flatten.compact.join('.')
    end

    IsolateController = ->(name) do
      "sprinkles.controller('#{name}', angular.noop);"
    end
  end
end
