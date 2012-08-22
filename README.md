# Twitter Bootswatch Rails gem
  
  - Integrates Twitter Bootstrap CSS toolkit for the Rails 3.1+ Asset Pipeline.
  - Easy control over which javascript and less modules are loaded by default. Not every app needs a carousel.
  - Simple default less files for custom application themes ("bootswatch/variables.less" and "bootswatch/bootswatch.less"). 
  - Easily apply custom themes or bootswatches from a site like [Bootswatch](http://bootswatch.com/).
  - Gem version semantics extend Twitter Bootstrap version semantics, making it simple to know what version of bootstrap the gem is using.

## Twitter Bootstrap for Rails 3.1+ Asset Pipeline
[Twitter Bootstrap](http://twitter.github.com/bootstrap/index.html) is a toolkit from Twitter designed to kickstart development of webapps and sites. It includes base CSS and HTML for typography, forms, buttons, tables, grids, navigation, and more.

## Demo

The [demo](https://github.com/scottvrosenthal/twitter-bootswatch-rails-demo) will show you how this gem can be used.

## Installing Gem

Include the [Twitter Bootswatch Rails gem](http://rubygems.org/gems/twitter-bootswatch-rails) in Gemfile to install it from [RubyGems.org](http://rubygems.org):

```ruby
gem 'twitter-bootswatch-rails', '~> 2.1.0.0'
```

or you can install from latest build;

```ruby
gem 'twitter-bootswatch-rails', :git => 'git://github.com/scottvrosenthal/twitter-bootswatch-rails.git'
```

You can run bundle from command line

    bundle install


## Installing to App (using Generators)

You can run the following generators to get started with Twitter Bootswatch quickly.


Install (requires directives to Asset pipeline.)


Usage:


    rails g bootswatch:install


Layout (generates a basic Twitter Bootstrap compatible layout) - ([haml-rails](https://github.com/indirect/haml-rails) gem supported)



Usage:


    rails g bootswatch:layout


Example:


    rails g bootswatch:layout application


Themed (generates Twitter Bootstrap compatible scaffold views.) - ([simple_form](https://github.com/plataformatec/simple_form) and [haml-rails](https://github.com/indirect/haml-rails) gems supported)


Usage:


    rails g bootswatch:themed [RESOURCE_NAME]


Example:


    rails g scaffold Post title:string description:text
    rake db:migrate
    rails g bootswatch:themed Posts



## Using less-rails gem

Read up on the [less-rails](https://github.com/metaskills/less-rails/) gem.

## Using stylesheets with Less

You have to require "bootswatch/loader.less" in your application.css

```css
/*
 *= require_self
 *= require bootswatch/loader
 *= require_tree
*/
```

"bootswatch/loader.less" allows you to easily comment out less modules you don't need in your application.

For instance, as per the Bootstrap project we don't include the responsive styles by default. Uncomment `@import "twitter/bootstrap/responsive";` in "bootswatch/loader.less" to enable it.

"bootswatch/variables.less" customize Twitter Bootstrap "variables.less" defaults in this file.

"bootswatch/bootswatch.less" customize the style of Twitter Bootstrap base css and component style here.

Check out some of the swatches at [Bootswatch](http://bootswatch.com/)

## Using Javascripts

You have to require the coffeescript file "bootswatch/loader.coffee" in your application.js:

```javascript
//= require jquery
//= require jquery_ujs
//= require bootswatch/loader
```

"bootswatch/loader.coffee" allows you to easily comment out modules you don't need in your application:

```coffee
# bootswatch/loader.coffee

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


#= require bootswatch/bootswatch
```

"bootswatch/bootswatch.coffee" allows you to easily add swatch customization to javascript modules loaded:

Check out some of the swatches at [Bootswatch](http://bootswatch.com/)

### Responsive styling?
As per the Bootstrap project we don't include the responsive styles by default. Uncomment `@import "twitter/bootstrap/responsive";` in "bootswatch/loader.less" to enable it.

## Versioning
Bootstrap [claims](https://github.com/twitter/bootstrap#versioning) to use SemVer, although this is for values of public API that don't seem to include selectively requiring CSS components (see breaking change 2.0.4 -> 2.1.0). Since many people using bootstrap-swatch-rails *do* selectively require CSS components and I consider it part of the public API we can't really follow SemVer without becoming wildly out of sync with the Bootstrap version number, which is confusing for everyone involved. Further releases to bootstrap-swatch-rails will therefore have version numbers of the form `2.x.x.y`, where `2.x.x` is the release of Bootstrap we should be compatible with, and `y` is the patch version.

## Changelog

  - Updated gem and bumped version to 2.1.0.0
