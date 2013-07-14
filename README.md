# Twitter Bootswatch Rails gem

[![Build Status](https://www.travis-ci.org/scottvrosenthal/twitter-bootswatch-rails.png?branch=master)](https://www.travis-ci.org/scottvrosenthal/twitter-bootswatch-rails)

  - Integrates Twitter Bootstrap CSS into the Rails 3.1+ Asset Pipeline
  - Easy optimization and control over which javascript and less modules are loaded 
    * *Not every app needs a carousel*
  - Simple default less files for custom application themes 
    * `[theme_name]/variables.less`
    * `[theme_name]/bootswatch.css.less`
  - Easily apply different custom themes or bootswatches from a site like [bootswatch.com](http://bootswatch.com/)
  - Create several themed swatches for your project with theme_names
    * e.g. an admin *(backend)* theme and a storefront *(frontend)* theme using namespaced theme_names
  - Build custom Twitter Bootstrap templates easily

## Includes Twitter Bootstrap for Rails 3.1+ Asset Pipeline
[Twitter Bootstrap](http://twitter.github.com/bootstrap/index.html) is a toolkit from Twitter designed to kickstart development of webapps and sites. It includes base CSS and HTML for typography, forms, buttons, tables, grids, navigation, and more.

## Including Font Awesome for Rails 3.1+ Asset Pipeline
[Font Awesome](http://fortawesome.github.io/Font-Awesome) is a toolkit with iconic fonts designed for use with Twitter Bootstrap.

To add Font Awesome to your bootswatch:

Include the gem [twitter-bootswatch-rails-fontawesome](https://github.com/scottvrosenthal/twitter-bootswatch-rails-fontawesome)

## Demo

The [demo](https://github.com/scottvrosenthal/twitter-bootswatch-rails-demo) will show you how this gem can be used in a rails 3.1+ application.

![Demo Screen Shot](https://github.com/scottvrosenthal/twitter-bootswatch-rails-demo/raw/master/demo.png)

## View Helpers
The gem [twitter-bootswatch-rails-helpers](https://github.com/scottvrosenthal/twitter-bootswatch-rails-helpers) provides rails view helpers for twitter bootstrap's breadcrumbs and alerts components.


## Install

Include the [Twitter Bootswatch Rails gem](http://rubygems.org/gems/twitter-bootswatch-rails) in Gemfile to install it from [RubyGems.org](http://rubygems.org):

```ruby

# twitter bootstrap css & javascript toolkit
gem 'twitter-bootswatch-rails'

# font awesome extension gem
gem 'twitter-bootswatch-rails-fontawesome'

# twitter bootstrap helpers gem, e.g., alerts etc...
gem 'twitter-bootswatch-rails-helpers'

```

or you can install from latest build;

```ruby
gem 'twitter-bootswatch-rails', :git => 'git://github.com/scottvrosenthal/twitter-bootswatch-rails.git'
```

Run bundle from command line

    bundle


## Installing to App (using Generators)

You can run the following generators to get started with Twitter Bootstrap.


If you don't provide a [theme_name] the value defaults to **bootswatch** and adds directives to your application.css and application.js files.


Usage:


    rails g bootswatch:install [theme_name]

Example:


    rails g bootswatch:install admin
    rails g bootswatch:install storefront

***

Layout (generates a basic Twitter Bootstrap compatible layout)

  - [haml-rails](https://github.com/indirect/haml-rails) gem supported
  - [slim-rails](https://github.com/slim-template/slim-rails) gem supported

Usage:


    rails g bootswatch:layout [theme_name]


Example:


    rails g bootswatch:layout admin
    rails g bootswatch:layout storefront

***

Themed (generates Twitter Bootstrap compatible scaffold views.)

  - [simple_form](https://github.com/plataformatec/simple_form) gem supported
  - [haml-rails](https://github.com/indirect/haml-rails) gem supported
  - [slim-rails](https://github.com/slim-template/slim-rails) gem supported


Usage (model and table must already exist):


    rails g bootswatch:themed [RESOURCE_NAME]


Example:


    rails g scaffold Post title:string description:text
    rake db:migrate
    rails g bootswatch:themed Posts

## Import a free [bootswatch.com](http://bootswatch.com/) theme

*(only available with twitter-bootswatch-rails v2.3.1.2+)*

### Just follow these three steps in the following order :)

    rails g bootswatch:install cyborg
    rails g bootswatch:import cyborg
    rails g bootswatch:layout cyborg

The above creates a namespaced theme under assets/javascript/cyborg assets/stylesheets/cyborg and a new layout file.

The import generator pulls directly from the [bootswatch.com](http://bootswatch.com/) git repo [cyborg](https://github.com/thomaspark/bootswatch/tree/gh-pages/cyborg) directory.

* bootswatch.less
* variables.less

In your rails controllers just tell it to use the cyborg layout.


```ruby
class ApplicationController < ActionController::Base
  # ...
  layout 'cyborg'
end
```

You can also create an admin namespaced theme and import the cyborg `bootswatch.less` and `variable.less` files:

    rails g bootswatch:install admin
    rails g bootswatch:import admin/cyborg
    rails g bootswatch:layout admin

Need more examples? Check out the [demo](https://github.com/scottvrosenthal/twitter-bootswatch-rails-demo)

## Using stylesheets with the [less-rails](https://github.com/metaskills/less-rails/) gem

You have to require `[theme_name]/loader.css.less` in your application.css

```css
/*
 *= require_self
 *= require [theme_name]/loader
 *= require [theme_name]/bootswatch
 *= require font-awesome/font-awesome
*/
```

`[theme_name]/loader.css.less` allows you to easily comment out less modules you don't need in your application.

For instance, as per the [Twitter Bootstrap](http://twitter.github.io/bootstrap/scaffolding.html#responsive) project we don't include the responsive styles by default. Uncomment `@import "twitter/bootstrap/responsive";` in "[theme_name]/loader.css.less" to enable it.

`[theme_name]/variables.less` customize Twitter Bootstrap "variables.less" defaults in this file.

`[theme_name]/bootswatch.css.less` customize the style of Twitter Bootstrap base css and component style here.

Check out some of the swatches at [bootswatch.com](http://bootswatch.com/)

Read up on the [less-rails](https://github.com/metaskills/less-rails/) gem.

***

#### base.less

When importing a custom `[theme_name]/bootswatch.css.less` file manually you'll need to include the following import directive at the top of the file:

```css
@import "[theme_name]/base";
```

The import `[theme_name]/base.less` directive allows the importing less file to access and override inherited less variables.

Example:

```css
@import "cyborg/base";
// Cyborg
// bootswatch.css.less
```

## Using Javascripts

You have to require the coffee script file `[theme_name]/loader.coffee` & `[theme_name]/bootswatch.js.coffee` in your application.js:

```javascript
//= require jquery
//= require jquery_ujs
//= require [theme_name]/loader
//= require [theme_name]/bootswatch
```

"[theme_name]/loader.coffee" allows you to easily comment out modules you don't need in your application:

```coffee
# [theme_name]/loader.coffee

#= require twitter/bootstrap/bootstrap-transition
#= require twitter/bootstrap/bootstrap-alert
#= require twitter/bootstrap/bootstrap-button
#= require twitter/bootstrap/bootstrap-carousel
#= require twitter/bootstrap/bootstrap-collapse
#= require twitter/bootstrap/bootstrap-dropdown
#= require twitter/bootstrap/bootstrap-modal
#= require twitter/bootstrap/bootstrap-tooltip
#= require twitter/bootstrap/bootstrap-popover
#= require twitter/bootstrap/bootstrap-scrollspy
#= require twitter/bootstrap/bootstrap-tab
#= require twitter/bootstrap/bootstrap-typeahead
#= require twitter/bootstrap/bootstrap-affix

```

`[theme_name]/bootswatch.js.coffee` allows you to easily add swatch customization to javascript modules loaded:

Check out some of the swatches at [bootswatch.com](http://bootswatch.com/)

***

## Misc

### Local rails development assets not updating?

```sh
RAILS_ENV=development rake assets:clean
```

***

### Less files are not found or loading errors for new rails application

*(Remove the default require_tree directive line from both the application.js & application.css files)*

```ruby
// remove the following line from application.js
//= require_tree .
```

```ruby
* remove the following line from application.css
*= require_tree .
```
***

### Adding custom assets to the asset pipeline when deploying

In config/application.rb add the [theme_name] files, e.g., `admin.js` & `admin.css` to config.assets.precompile:

```ruby
# Precompile additional assets
config.assets.precompile += %w(admin.js admin.css cyborg.js cyborg.css)
```

***

### Default generators to use less-rails gem

In config/application.rb add the following line:

```ruby
# less-rails gem (default all generators)
config.app_generators.stylesheet_engine :less
```

***

### List of Twitter Bootstrap plugins

  - [the-big-badass-list-of-twitter-bootstrap-resources](http://bootstraphero.com/the-big-badass-list-of-twitter-bootstrap-resources)

***

### Responsive styling?
As per the [Twitter Bootstrap](http://twitter.github.io/bootstrap/scaffolding.html#responsive) project we don't include the responsive styles by default. Uncomment `@import "twitter/bootstrap/responsive";` in `[theme_name]/bootswatch.css.less` to enable it.

***

## Versioning
Bootstrap [claims](https://github.com/twitter/bootstrap#versioning) to use SemVer, although this is for values of public API that don't seem to include selectively requiring CSS components (see breaking change 2.0.4 -> 2.1.0). Since many people using bootstrap-swatch-rails *do* selectively require CSS components and I consider it part of the public API we can't really follow SemVer without becoming wildly out of sync with the Bootstrap version number, which is confusing for everyone involved. Further releases to bootstrap-swatch-rails will therefore have version numbers of the form `2.x.x.y`, where `2.x.x` is the release of Bootstrap we should be compatible with, and `y` is the patch version.

## Changelog
  - v2.3.1.0
    * Updated to bootstrap 2.3.1
  - v2.3.1.1
    * Added theme_name functionality, if a theme_name isn't passed in you get the default install, i.e, uses bootswatch as theme_name
    * Included bootstrap version number at the top of each asset file created by generators
    * Added Font Awesome to the asset pipeline as an opt in using an asset directive
    * Added import generator to dynamically pull in free bootswatch.com themes and add correct import directives
  - v2.3.1.2
    * Updated gemspec docs
    * Updated import generator to allow importing bootswatch.com themes under existing namespaced themes
      * rails g bootswatch:import admin/cyborg
  - v2.3.2.0 *(breaking changes ~ font-awesome)*
    * Updated to bootstrap 2.3.2
    * Removed/Refactored Font Awesome functionality into separate gem [twitter-bootswatch-rails-fontawesome](https://github.com/scottvrosenthal/twitter-bootswatch-rails-fontawesome)
  - v2.3.2.2
    * Rails 4 bug fix for generator error
  - v2.3.2.3
    * Slim functionality added
  - v2.3.2.4
    * Install generator update to allow modifications trigger an asset recompile for the following files `[theme_name]/bootswatch.css.less` & `[theme_name]/bootswatch.js.coffee`
    * Install generator will automatically remove `require_tree .` wildcard directives when found in `application.js` & `application.css`
  - v2.3.2.5
    * Bug fixes for import & install generators
  - v2.3.2.6
    * Install generator now places `@import "twitter/bootstrap/responsive";` inside `[theme_name]/bootswatch.css.less`
    * Install generator now comments out `@import "twitter/bootstrap/variables";` & `@import "twitter/bootstrap/mixins";` inside `[theme_name]/loader.css.less`
    * Refactoring of templates for easier readability
