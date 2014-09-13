# Angular Sprinkles

[![Gem Version](https://badge.fury.io/rb/angular_sprinkles.svg)](http://badge.fury.io/rb/angular_sprinkles)
[![Circle CI](https://circleci.com/gh/BrewhouseTeam/angular_sprinkles.png?style=badge)](https://circleci.com/gh/BrewhouseTeam/angular_sprinkles)

Angular Sprinkles is a gem for writing Rails-flavored AngularJS.

- __No frontend setup required:__ By just requiring it in your project, sprinkles dynamically generates an Angular application around your Rails templates. It's never been easier to start developing with Angular and Rails.
- __Rails as it was intended to be written:__ Angular's two-way data binding, directives, and function calls are all done in the view via helper methods, giving you just a sprinkle of JavaScript.
- __Forget about the SPA:__ If you're not using Rails an API, trying to build an SPA on top of it is a huge pain. Sprinkles allows you to continue to write Rails applications as you always have without all of the nasty jQuery spaghetti.

## Examples

Two-way binding works right out of the box with Sprinkles. Just wrap your objects with the `bindable` helper.

```ruby
class UserController < ApplicationController
  def show
    # bindable gives your objects the bind method
    @user = bindable(User.find(params[:id]))
  end
end
```

```erb
{{ <%= @user.bind(:name) %> }}
<input type="text" ng-model="<%= @user.bind(:name) %>" />
```

Use custom directives with the `directive` helper.

```erb
<script>
sprinkles.directive('blink', function () {
  // re-implement the blink tag
});
</script>

<%= directive(:blink) %>
```

Call services directly from the view with the `service` helper.

```erb
<script>
sprinkles.service('alertMe', function () {
  return function (input) {
    alert('Hello, ' + input);
  };
});
</script>

<button ng-click="<%= service(:alert_me, "Brewhouse") %>">Click me!</button>
```

## Setup

Add `angular_sprinkles` to your `Gemfile`.

```ruby
gem 'angular_sprinkles'
```

Add `yield :sprinkles` to the bottom of your body tag.

```erb
<body>

<%= yield %>

<%= yield :sprinkles %>
</body>
```

Include and `angular_sprinkles` into your `application.js`.

```js
//= require angular_sprinkles
//= require_tree .
```

## Copyright

Copyright (c) 2014 Gabe Scholz, Brewhouse Software. See LICENSE.txt for further details.
