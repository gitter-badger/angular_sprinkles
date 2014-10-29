# Angular Sprinkles

[![Gem Version](https://badge.fury.io/rb/angular_sprinkles.svg)](http://badge.fury.io/rb/angular_sprinkles)
[![Circle CI](https://circleci.com/gh/BrewhouseTeam/angular_sprinkles.png?style=badge)](https://circleci.com/gh/BrewhouseTeam/angular_sprinkles)
[![Coverage Status](https://coveralls.io/repos/BrewhouseTeam/angular_sprinkles/badge.png?branch=master)](https://coveralls.io/r/BrewhouseTeam/angular_sprinkles?branch=master)

Angular Sprinkles is a gem for writing Rails-flavored AngularJS.

- __No frontend setup required:__ By just requiring it in your project, Sprinkles dynamically generates an Angular application around your Rails templates. It's never been easier to start developing with Angular and Rails.
- __Rails as it was intended to be written:__ Angular's two-way data binding, directives, and function calls are all done in the view via helper methods, giving you just a sprinkle of JavaScript.
- __A cleaner approach to JavaScript:__ Sprinkles allows you to continue to write Rails applications as you always have without all of the nasty jQuery spaghetti.


## Setup

Add `angular_sprinkles` to your `Gemfile`.

```ruby
gem 'angularjs-rails'
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

## Examples

- [Two-way binding](#two-way-binding)
- [Directives](#directives)
- [Controllers and isolate scopes](#controllers-and-isolate-scopes)
- [Inlining function calls](#inlining-function-calls)
- [Form helpers](#form-helpers)
- [Forcing ruby wrappers for variable names](#forcing-ruby-wrappers-for-variable-names)

### Two-way binding

Two-way binding works right out of the box with Sprinkles. Just wrap your objects with the `bindable` helper.

```ruby
class UserController < ApplicationController
  def show
    # bindable gives your objects the bind method
    @user = ng_bindable(User.find(params[:id]))
  end
end
```

```erb
{{ <%= @user.bind(:name) %> }}
<input type="text" ng-model="<%= @user.bind(:name) %>" />
```

### Directives

Use custom directives with the `directive` helper.

```erb
<script>
sprinkles.directive('blink', function () {
  // re-implement the blink tag
});
</script>

<%= ng_directive(:blink) do %>
  Hello, world
<% end %>
```

Directives can also return it's controller to a ruby block if the directive uses transclusion.

```erb
<script>
sprinkles.directive('someDirective', function () {
  return {
    transclude: true,
    template: '<div ng-transclude></div>',
    // note: 'controllerAs' must be the directive name + 'Ctrl'
    controllerAs: 'someDirectiveCtrl',
    controller: function () {
      this.alertMe = function (name) {
        alert('Hi, ' + name);
      };
    }
  }
});
</script>

<%= ng_directive(:someDirective) do |some_ctrl| %>
  <button ng-click="<%= some_ctrl.call(:alertMe, 'Gabe') %>">CLICK ME!</button>
<% end %>
```

### Controllers and isolate scopes

If you would rather skip the directive and just create a controller, there is the `ctrl` helper.

```erb
<script>
sprinkles.controller('someCtrl', function () {
  this.alertMe = function (name) {
    alert('Hi, ' + name);
  };
});
</script>

<%= ng_controller(:someCtrl) do |some_ctrl| %>
  <button ng-click="<%= some_ctrl.call('Gabe') %>">CLICK ME!</button>
<% end %>
```

This is good for localizing JavaScript behavior. Additionally, if you'd just like to create a new
scope, you can use the `isolate` helper which creates an "anonymous" controller to wrap your element.

```erb
<%= ng_isolate do |iso_ctrl| %>
  <input ng-model="<%= iso_ctrl.bind(:isolated_binding) %>">
  {{ <%= iso_ctrl.bind(:isolated_binding) %> }}
<% end %>
```

In contrast with the `bind` helper, bindings made here do not apply to the scope of the root controller.

### Inlining function calls

Call services directly from the view with the `service` helper.

```erb
<script>
sprinkles.service('alertMe', function () {
  return function (input) {
    alert('Hello, ' + input);
  };
});
</script>

<button ng-click="<%= ng_service(:alertMe, "world") %>">Click me!</button>
```

### Form helpers

Sprinkles comes with helpers for automatically creating bindings with your form elements. Almost all of the usual form helpers are available with the `bind_*` prefix. (See [issue #4](https://github.com/BrewhouseTeam/angular_sprinkles/issues/4) for a list of helpers that are not currently supported).

```erb
<%= form_for @user do |f| %>
  <%= f.bind_text_field :name %>
  <%= f.bind_select :age, (1..99) %>
<% end %>

<div>
  <%=# This value is automatically bound to the input of the form %>
  {{ <%= @user.bind(:name) %> }}
</div>
```

Additionally, the `bind_form_for` helper will prevent the form from being submitted and bind the form submission to an Angular service.

```erb
<script>
sprinkles.service('userFormHandler', function () {
  // receives the object and the AngularJS representation of the form
  return function (user, form) {
    // do something with the result
  };
});
</script>

<%= ng_form_for @user, :user_form_handler do |f| %>
  <%= f.bind_text_field :name %>
<% end %>
```

### Forcing ruby wrappers for variable names

It is sometimes useful to be able to wrap a variable name into a ruby helper. The following example illustrates how it may be useful to
wrap the result of a `ng-repeat` so that it can be combined with the other helpers in this library.

```erb
<div ng-repeat="user in <%= @users.bind %>">
  <%= ng_wrap('user') do |user| %>
    {{ <%= user.bind %> }}
    <button ng-click="<%= ng_service(:alertMe, user.bind(:name)) %>">Alert me!</button>
  <% end %>
</div>
```

`ng_wrap` is also capable of accepting multiple parameters.

```erb
  <%= ng_wrap('user', 'user.name') do |user, name| %>
    {{ <%= user.bind %> }}
    <button ng-click="<%= ng_service(:alertMe, name.bind) %>">Alert me!</button>
  <% end %>
```

### I want more!

Also see the [demo application](https://github.com/BrewhouseTeam/angular_sprinkles_example) for more examples.

## Copyright

Copyright (c) 2014 Gabe Scholz, Brewhouse Software. See LICENSE.txt for further details.
