# Twitter Bootswatch Rails gem
  
  - Integrates Twitter Bootstrap CSS & Font Awesome toolkit into the Rails 3.1+ Asset Pipeline.
  - Easy control over which javascript and less modules are loaded by default. Not every app needs a carousel.
  - Simple default less files for custom application themes ("bootswatch/variables.less" and "bootswatch/bootswatch.less"). 
  - Easily apply different custom themes or bootswatches from a site like [Bootswatch](http://bootswatch.com/).
  - Create several themed swatches for your project with theme_names, (e.g. an admin theme and a site theme using namespaced theme_names).
  - Gem version semantics extend Twitter Bootstrap version semantics, making it simple to know what version of bootstrap the gem is using.

## Twitter Bootstrap for Rails 3.1+ Asset Pipeline
[Twitter Bootstrap](http://twitter.github.com/bootstrap/index.html) is a toolkit from Twitter designed to kickstart development of webapps and sites. It includes base CSS and HTML for typography, forms, buttons, tables, grids, navigation, and more.

## Demo

The [demo](https://github.com/scottvrosenthal/twitter-bootswatch-rails-demo) will show you how this gem can be used.

![Demo Screen Shot](https://github.com/scottvrosenthal/twitter-bootswatch-rails-demo/raw/master/demo.png)

## View Helpers
The gem [twitter-bootswatch-rails-helpers](https://github.com/scottvrosenthal/twitter-bootswatch-rails-helpers) provides rails view helpers for twitter bootstrap's breadcrumbs and alerts components.


## Installing Gem

Include the [Twitter Bootswatch Rails gem](http://rubygems.org/gems/twitter-bootswatch-rails) in Gemfile to install it from [RubyGems.org](http://rubygems.org):

```ruby
group :assets do
  # rails default gems
  ...

  # just put after rails asset defaults
  gem 'twitter-bootswatch-rails', '~= 2.3.1.1'

end

# View Helpers Gem can go outside the assets group
gem 'twitter-bootswatch-rails-helpers', '>= 2.3.1'
```

or you can install from latest build;

```ruby
gem 'twitter-bootswatch-rails', :git => 'git://github.com/scottvrosenthal/twitter-bootswatch-rails.git'
```

Run bundle from command line

    bundle


## Installing to App (using Generators)

You can run the following generators to get started with Twitter Bootswatch & FontAwesome quickly.


Install (requires directives to Asset pipeline.)


Usage:


    rails g bootswatch:install [theme_name]

Example:


    rails g bootswatch:install admin
    rails g bootswatch:install cyborg

Layout (generates a basic Twitter Bootstrap compatible layout) - ([haml-rails](https://github.com/indirect/haml-rails) gem supported)


Usage:


    rails g bootswatch:layout [theme_name]


Example:


    rails g bootswatch:layout admin
    rails g bootswatch:layout cyborg


Themed (generates Twitter Bootstrap compatible scaffold views.) - ([simple_form](https://github.com/plataformatec/simple_form) and [haml-rails](https://github.com/indirect/haml-rails) gems supported)


Usage (model and table must already exist):


    rails g bootswatch:themed [RESOURCE_NAME]


Example:


    rails g scaffold Post title:string description:text
    rake db:migrate
    rails g bootswatch:themed Posts

## Import a free [Bootswatch](http://bootswatch.com/) theme

### Just follow these 3 steps in order :)

    rails g bootswatch:install cyborg
    rails g bootswatch:import cyborg
    rails g bootswatch:layout cyborg

The above creates a namespaced theme under assets/javascript/cyborg assets/stylesheets/cyborg and a new layout file.

The import generator pulls directly from the [Bootswatch](http://bootswatch.com/) git repo [cyborg](https://github.com/thomaspark/bootswatch/tree/gh-pages/cyborg) directory.

* bootswatch.less
* variables.less

In your rails controllers just tell it to use the cyborg layout.

    layout: 'cyborg'

Need more examples? Check out the [demo](https://github.com/scottvrosenthal/twitter-bootswatch-rails-demo)

## Using less-rails gem

Read up on the [less-rails](https://github.com/metaskills/less-rails/) gem.

## Using stylesheets with Less

You have to require "bootswatch/loader.css.less" in your application.css

```css
/*
 *= require_self
 *= require bootswatch/loader
 *= require font-awesome/font-awesome
*/
```

"bootswatch/loader.css.less" allows you to easily comment out less modules you don't need in your application.

For instance, as per the Bootstrap project we don't include the responsive styles by default. Uncomment `@import "twitter/bootstrap/responsive";` in "bootswatch/loader.css.less" to enable it.

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

### Local rails development assets not updating?

```sh
RAILS_ENV=development rake assets:clean
```

## Versioning
Bootstrap [claims](https://github.com/twitter/bootstrap#versioning) to use SemVer, although this is for values of public API that don't seem to include selectively requiring CSS components (see breaking change 2.0.4 -> 2.1.0). Since many people using bootstrap-swatch-rails *do* selectively require CSS components and I consider it part of the public API we can't really follow SemVer without becoming wildly out of sync with the Bootstrap version number, which is confusing for everyone involved. Further releases to bootstrap-swatch-rails will therefore have version numbers of the form `2.x.x.y`, where `2.x.x` is the release of Bootstrap we should be compatible with, and `y` is the patch version.

## Changelog
  - v2.3.1.0
    * Updated to bootstrap 2.3.1
  - v2.3.1.1
    * Added theme_name functionality, if a theme_name isn't passed in you get the default install
    * Included bootstrap version number at the top of each asset file created by generators
    * Added Font Awesome to the asset pipeline as an opt in using an asset directive
    * Added import generator to dynamically pull in free bootswatch.com themes and add correct import directives
  - v2.3.1.2
    * Updated gemspec to thor >= 0.18
