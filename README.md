# Twitter Bootstrap for Rails 3.2+ Asset Pipeline
Bootstrap is a toolkit from Twitter designed to kickstart development of webapps and sites. It includes base CSS and HTML for typography, forms, buttons, tables, grids, navigation, and more.

twitter-bootswatch-rails project integrates Bootstrap CSS toolkit for Rails 3.2+ Asset Pipeline

twitter-bootswatch-rails project is a fork and customization of the
[Twitter Bootstrap Rails gem](https://github.com/seyhunak/twitter-bootstrap-rails)

So if you are wanting view helpers etc... please see [Twitter Bootstrap Rails gem](https://github.com/seyhunak/twitter-bootstrap-rails)

Why twitter-bootswatch-rails?

I needed a core twitter bootstrap rails gem for projects, and I found myself having to override a lot of the helpers/fonts that were being added with each release.

I kept the generator functionality but removed all view helpers and any extra stuff that's not included in Twitter Bootstrap core.

Plus, I wanted to be able to mix in different Twitter Bootstrap swatches/styles easily from a site like [Bootswatch](http://bootswatch.com/).

twitter-bootswatch-rails project will only be core Twitter Bootstrap.  If there's a real need for extra fluff, well I'd create an extension gem called twitter-bootswatch-rails-ext instead.

## Installing Gem

Include the [Twitter Bootswatch Rails gem](http://rubygems.org/gems/twitter-bootswatch-rails) in Gemfile to install it from [RubyGems.org](http://rubygems.org):

```ruby
gem "twitter-bootswatch-rails"
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

Bootswatch was built with Preboot, an open-source pack of mixins and variables to be used in conjunction with Less, a CSS preprocessor for faster and easier web development.

## Using stylesheets with Less

You have to require Bootstrap LESS (twitter_bootstrap.less and twitter_bootswatch.less) in your application.css

```css
/*
 *= require twitter_bootstrap
 *= require twitter_bootswatch
 */

/* Your stylesheets goes here... */
```

"twitter_bootstrap.less" should always be loaded before "twitter_bootswatch.less"

"twitter_bootstrap.less" is for core style configuration that allows you to easily comment out modules you don't need in your application.

For instance, as per the Bootstrap project we don't include the responsive styles by default. Uncomment `@import "bootstrap-responsive";` in "twitter_bootstrap.less" to enable it.

"twitter_bootswatch.less" is core style configuration that allows you to easily comment out modules you don't need in your application.

For instance, if you'd like to alter Bootstrap's own style variables, or define your LESS
styles inheriting Bootstrap's mixins, you can do so inside twitter_bootswatch.less.


## Using Javascripts

You have to require the coffee files (twitter_bootstrap.coffee and twitter_bootswatch.coffee) in your application.js

"twitter_bootstrap.coffee" should always be loaded before "twitter_bootswatch.coffee"

"twitter_bootstrap.coffee" allows you to easily comment out modules you don't need in your application:

```coffee
#= require twitter/bootstrap/bootstrap-transition
#= require twitter/bootstrap/bootstrap-alert
#= require twitter/bootstrap/bootstrap-modal
#= require twitter/bootstrap/bootstrap-dropdown
#= require twitter/bootstrap/bootstrap-scrollspy
#= require twitter/bootstrap/bootstrap-tab
#= require twitter/bootstrap/bootstrap-tooltip
#= require twitter/bootstrap/bootstrap-popover
#= require twitter/bootstrap/bootstrap-button
#= require twitter/bootstrap/bootstrap-collapse
#= require twitter/bootstrap/bootstrap-carousel
#= require twitter/bootstrap/bootstrap-typeahead
```

"twitter_bootswatch.coffee" allows you to easily add customization to modules loaded:

Here's the default for "twitter_bootswatch.coffee":

```coffee
jQuery ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()
```

### Responsive styling?
As per the Bootstrap project we don't include the responsive styles by default. Uncomment `@import "bootstrap-responsive";` in "twitter_bootstrap.less" to enable it.

## Versioning
Bootstrap [claims](https://github.com/twitter/bootstrap#versioning) to use SemVer, although this is for values of public API that don't seem to include selectively requiring CSS components (see breaking change 2.0.2 -> 2.0.3). Since many people using bootstrap-sass *do* selectively require CSS components and I consider it part of the public API we can't really follow SemVer without becoming wildly out of sync with the Bootstrap version number, which is confusing for everyone involved. Further releases to bootstrap-swatch-rails will therefore have version numbers of the form `2.x.x.y`, where `2.x.x` is the release of Bootstrap we should be compatible with, and `y` is the patch version.

## Changelog

  - Forked version 2.1.1 from [Twitter Bootstrap Rails gem](https://github.com/seyhunak/twitter-bootstrap-rails)
  - Renamed to twitter-bootswatch-rails version 2.0.4.0
  - Fixed generator rename bugs and bumped version 2.0.4.2
