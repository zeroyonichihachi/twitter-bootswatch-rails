# Twitter Bootstrap for Rails 3.1+ Asset Pipeline
Bootstrap is a toolkit from Twitter designed to kickstart development of webapps and sites. It includes base CSS and HTML for typography, forms, buttons, tables, grids, navigation, and more.

twitter-bootswatch-rails project integrates Bootstrap CSS toolkit for Rails 3.1+ Asset Pipeline

Why twitter-bootswatch-rails?

Easily control which javascript and less modules are loaded by default.

Easily mix Twitter Bootstrap swatches/styles easily from a site like [Bootswatch](http://bootswatch.com/).

twitter-bootswatch-rails project will only be core Twitter Bootstrap, i.e., only purpose is to bootstrap the project and provide easy access to customization.

## Installing Gem

Include the [Twitter Bootswatch Rails gem](http://rubygems.org/gems/twitter-bootswatch-rails) in Gemfile to install it from [RubyGems.org](http://rubygems.org):

```ruby
gem 'twitter-bootswatch-rails', '~> 2.0.4.6'
```

or you can install from latest build;

```ruby
gem 'twitter-bootswatch-rails', :git => 'git://github.com/scottvrosenthal/twitter-bootswatch-rails.git'
```

You can run bundle from command line

    bundle install


## Installing to App (using Generators)

You can run following generators to get started with Twitter Bootstrap quickly.


Install (requires directives to Asset pipeline.)


Usage:


    rails g bootswatch:install


Layout (generates Twitter Bootstrap compatible layout) - (Haml and Slim supported)


Usage:


    rails g bootswatch:layout [LAYOUT_NAME] [*ﬁxed or ﬂuid]


Example:


    rails g bootswatch:layout application fixed


Themed (generates Twitter Bootstrap compatible scaffold views.) - (Haml and Slim supported)


Usage:


    rails g bootswatch:themed [RESOURCE_NAME]


Example:


    rails g scaffold Post title:string description:text
    rake db:migrate
    rails g bootswatch:themed Posts



## Using with Less

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

"loader.less" is for core style configuration that allows you to easily comment out modules you don't need in your application.

For instance, as per the Bootstrap project we don't include the responsive styles by default. Uncomment `@import "twitter/bootstrap/responsive";` in "loader.less" to enable it.

"bootswatch/variables.less" and "bootswatch/bootswatch.less" allows you to easily switch out swatches in your application.

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
# loader.coffee

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


#= require bootswatch/bootswatch
```

"bootswatch.coffee" allows you to easily add swatch customization to javascript modules loaded:

Check out some of the swatches at [Bootswatch](http://bootswatch.com/)

### Responsive styling?
As per the Bootstrap project we don't include the responsive styles by default. Uncomment `@import "twitter/bootstrap/responsive";` in "twitter_bootstrap.less" to enable it.

## Versioning
Bootstrap [claims](https://github.com/twitter/bootstrap#versioning) to use SemVer, although this is for values of public API that don't seem to include selectively requiring CSS components (see breaking change 2.0.2 -> 2.0.3). Since many people using bootstrap-swatch-rails *do* selectively require CSS components and I consider it part of the public API we can't really follow SemVer without becoming wildly out of sync with the Bootstrap version number, which is confusing for everyone involved. Further releases to bootstrap-swatch-rails will therefore have version numbers of the form `2.x.x.y`, where `2.x.x` is the release of Bootstrap we should be compatible with, and `y` is the patch version.

## Changelog

  - Forked version 2.1.1 from [Twitter Bootstrap Rails gem](https://github.com/seyhunak/twitter-bootstrap-rails)
  - Renamed to twitter-bootswatch-rails version 2.0.4.0
  - Bumped version 2.0.4.6
