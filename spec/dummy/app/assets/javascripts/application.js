// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require angular_sprinkles
//= require_tree .

sprinkles.service('hello_world', function () {
  return function (input) {
    return "Hello " + input;
  };
});

sprinkles.service('form_submitted', function () {
  return function (model, form) {
    return model.life = '42';
  };
});

sprinkles.directive('bigHelloWorld', function () {
  return {
    scope: true,
    controllerAs: 'bigHelloWorldCtrl',
    controller: function () {
      this.attribute = 'bigHelloWorldCtrlAttribute';

      this.func = function (name) {
        return name;
      };
    }
  }
});

sprinkles.directive('nestedDirective', function () {
  return {
    scope: {
      name: '='
    },
    template: '<h2>{{name}}</h2>'
  };
});

sprinkles.controller('someCtrl', function () {
  this.someValue = 42;
});
