# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: angular_sprinkles 0.0.5 ruby lib

Gem::Specification.new do |s|
  s.name = "angular_sprinkles"
  s.version = "0.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Gabe Scholz"]
  s.date = "2014-09-13"
  s.description = "Add a few sprinkles of AngularJS to your Rails App"
  s.email = "gabe@brewhouse.io"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "angular_sprinkles.gemspec",
    "app/assets/javascripts/angular_sprinkles.js.erb",
    "lib/angular_sprinkles.rb",
    "lib/angular_sprinkles/constructor.rb",
    "lib/angular_sprinkles/constructor_collection.rb",
    "lib/angular_sprinkles/content_cache.rb",
    "lib/angular_sprinkles/content_yielder.rb",
    "lib/angular_sprinkles/context.rb",
    "lib/angular_sprinkles/controller.rb",
    "lib/angular_sprinkles/counter.rb",
    "lib/angular_sprinkles/directive/attributes.rb",
    "lib/angular_sprinkles/directive/input.rb",
    "lib/angular_sprinkles/directive/name.rb",
    "lib/angular_sprinkles/directive/options.rb",
    "lib/angular_sprinkles/engine.rb",
    "lib/angular_sprinkles/helpers.rb",
    "lib/angular_sprinkles/helpers/directive_helper.rb",
    "lib/angular_sprinkles/helpers/service_helper.rb",
    "lib/angular_sprinkles/java_script.rb",
    "lib/angular_sprinkles/key_generator.rb",
    "lib/angular_sprinkles/model_decorator.rb",
    "lib/angular_sprinkles/object_key_wrapper.rb",
    "lib/angular_sprinkles/railtie.rb",
    "spec/angular_sprinkles/constructor_collection_spec.rb",
    "spec/angular_sprinkles/constructor_spec.rb",
    "spec/angular_sprinkles/content_cache_spec.rb",
    "spec/angular_sprinkles/content_yielder_spec.rb",
    "spec/angular_sprinkles/context_spec.rb",
    "spec/angular_sprinkles/counter_spec.rb",
    "spec/angular_sprinkles/directive/attributes_spec.rb",
    "spec/angular_sprinkles/directive/input_spec.rb",
    "spec/angular_sprinkles/directive/name_spec.rb",
    "spec/angular_sprinkles/directive/options_spec.rb",
    "spec/angular_sprinkles/key_generator_spec.rb",
    "spec/angular_sprinkles/model_decorator_spec.rb",
    "spec/angular_sprinkles/object_key_wrapper_spec.rb",
    "spec/controllers/test_controller_spec.rb",
    "spec/dummy/.rspec",
    "spec/dummy/README.rdoc",
    "spec/dummy/Rakefile",
    "spec/dummy/app/assets/images/.keep",
    "spec/dummy/app/assets/javascripts/application.js",
    "spec/dummy/app/assets/stylesheets/application.css",
    "spec/dummy/app/controllers/application_controller.rb",
    "spec/dummy/app/controllers/concerns/.keep",
    "spec/dummy/app/controllers/test_controller.rb",
    "spec/dummy/app/helpers/application_helper.rb",
    "spec/dummy/app/mailers/.keep",
    "spec/dummy/app/models/.keep",
    "spec/dummy/app/models/concerns/.keep",
    "spec/dummy/app/models/test_model.rb",
    "spec/dummy/app/views/layouts/application.html.erb",
    "spec/dummy/app/views/test/new.html.erb",
    "spec/dummy/bin/bundle",
    "spec/dummy/bin/rails",
    "spec/dummy/bin/rake",
    "spec/dummy/config.ru",
    "spec/dummy/config/application.rb",
    "spec/dummy/config/boot.rb",
    "spec/dummy/config/database.yml",
    "spec/dummy/config/environment.rb",
    "spec/dummy/config/environments/development.rb",
    "spec/dummy/config/environments/production.rb",
    "spec/dummy/config/environments/test.rb",
    "spec/dummy/config/initializers/assets.rb",
    "spec/dummy/config/initializers/backtrace_silencers.rb",
    "spec/dummy/config/initializers/cookies_serializer.rb",
    "spec/dummy/config/initializers/filter_parameter_logging.rb",
    "spec/dummy/config/initializers/inflections.rb",
    "spec/dummy/config/initializers/mime_types.rb",
    "spec/dummy/config/initializers/session_store.rb",
    "spec/dummy/config/initializers/wrap_parameters.rb",
    "spec/dummy/config/locales/en.yml",
    "spec/dummy/config/routes.rb",
    "spec/dummy/config/secrets.yml",
    "spec/dummy/db/migrate/20140908021353_create_test_models.rb",
    "spec/dummy/db/schema.rb",
    "spec/dummy/lib/assets/.keep",
    "spec/dummy/log/.keep",
    "spec/dummy/public/404.html",
    "spec/dummy/public/422.html",
    "spec/dummy/public/500.html",
    "spec/dummy/public/favicon.ico",
    "spec/features/javascript_spec.rb",
    "spec/rails_helper.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = "http://github.com/BrewhouseTeam/angular_sprinkles"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.1"
  s.summary = "Add a few sprinkles of AngularJS to your Rails App"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 0"])
      s.add_runtime_dependency(%q<angularjs-rails>, [">= 0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<rspec-rails>, [">= 0"])
      s.add_development_dependency(%q<capybara>, [">= 0"])
      s.add_development_dependency(%q<selenium-webdriver>, [">= 0"])
      s.add_development_dependency(%q<launchy>, [">= 0"])
      s.add_development_dependency(%q<byebug>, [">= 0"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
    else
      s.add_dependency(%q<rails>, [">= 0"])
      s.add_dependency(%q<angularjs-rails>, [">= 0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<rspec-rails>, [">= 0"])
      s.add_dependency(%q<capybara>, [">= 0"])
      s.add_dependency(%q<selenium-webdriver>, [">= 0"])
      s.add_dependency(%q<launchy>, [">= 0"])
      s.add_dependency(%q<byebug>, [">= 0"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 0"])
    s.add_dependency(%q<angularjs-rails>, [">= 0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<rspec-rails>, [">= 0"])
    s.add_dependency(%q<capybara>, [">= 0"])
    s.add_dependency(%q<selenium-webdriver>, [">= 0"])
    s.add_dependency(%q<launchy>, [">= 0"])
    s.add_dependency(%q<byebug>, [">= 0"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
  end
end

