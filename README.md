# Angular Sprinkles

__WARNING: This gem is unstable and rapidly changing at the moment. README.md may not reflect the actual API.__

Sprinkles is a Ruby on Rails gem for developers who want to use Angular's two most powerful features - two-way data binding and
custom directives - without all of the regular setup required for a typical Angular-based application.

Sprinkles injects just enough JavaScript onto your page to make you dangerous. It is intended to be used by developers who just
want a sprinkle of Angular instead of a full-blown application.

## Setup

Add Angular and Sprinkles to your `Gemfile`

```ruby
# Gemfile

gem 'angularjs-rails'
gem 'angular_sprinkles'
```

Add a yield method for your sprinkles at the bottom of your body tag

```erb
<%=# app/views/layouts/application.html.erb %>
<body>

<%= yield %>

<%= yield :sprinkles %>
</body>
```

Include Angular and Sprinkles into your `application.js`

```js
// app/assets/javascripts/application.js

//= require angular
//= require angular_sprinkles
//= require_tree .
```

That's it! You are now read to begin using Sprinkles in your application. There is no need to create an application module or
controller. Sprinkles dynamically generates this for you.

## Data binding

Two-way data binding with Sprinkles is easy. We can use the `bindable` view helper to decorate our record with the bind method

```ruby
class UserController < ApplicationController
  def show
    @user = bindable(User.find(params[:id]))
  end
end
```

Our user is now also able to use `bind`

```erb
<%=# some view %>

Bind the entire object: <span ng-bind="<%= @user.bind %>"></span>

Full Name: <span ng-bind="<%= @user.bind(:first_name) %>  + ' ' + <%= @user.bind(:last_name) %>"></span>
First Name: <input type="text" ng-model="<%= @user.bind(:first_name) %>" />
Last Name: <input type="text" ng-model="<%= @user.bind(:last_name) %>" />
```

We've got two-way data binding of persisted data without writing a single line of javascript!

## Custom Directives

Sprinkles also comes packaged with a helper for instantiating custom directives.

In order to write custom directives, you must add them to the sprinkles module which is attached to the global `sprinkles` variable.
Let's create an element that blinks some text.

```js
// some js file

sprinkles.directive('blink', function ($interval) {
  return {
    restrict: 'A',
    scope: {
      interval: '=',
      text: '='
    },
    template: '<span>{{text}}</span>',
    link: function (scope, el) {
      var opacity = 1;

      scope.text = scope.text || 'Hello World!';
      scope.interval = scope.interval || 1000;

      $interval(function () {
        el.css({ opacity: opacity });
        opacity = -opacity + 1;
      }, scope.interval);
    }
  }
});
```

```erb
<%=# some view %>

<%= directive(:blink, { interval: 250, text: 'Blink Me!' }) %>
```

"Blink Me!" will now flash on the screen. We can also combine this directive with the `bind` helper so that we can change the text on the fly

```erb
<%=# some view %>

<%= directive(:blink, { interval: 250, text: bind(:blink_text) }) %>
<input type="text" ng-model="<%= bind(:blink_text) %>" />
```

## Calling custom functions in the view

Angular frequently makes use of calling functions in the view for directives such as `ng-click`. You can bind custom functions to the view by first writing a service and then calling `service`

```js
// some js file

sprinkles.service('alert_it', function (someInjectedDependency) {
  return function (input) {
    var modifiedInput = someInjectedDependency(input);
    alert(modifiedInput);
  };
});
```

```erb
<%=# some view %>

<button ng-click="<%= service(:alert_it, @user.bind(:first_name)) %>">Click Me!</button>;
```

## Copyright

Copyright (c) 2014 Gabe Scholz, Brewhouse Software. See LICENSE.txt for further details.