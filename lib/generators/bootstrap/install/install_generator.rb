require 'rails/generators'

module Bootswatch
  module Generators
    class InstallGenerator < ::Rails::Generators::Base

      source_root File.expand_path("../templates", __FILE__)
      desc "This generator installs Twitter Bootstrap to Asset Pipeline"

      def add_assets

        if File.exist?('app/assets/javascripts/application.js')
          insert_into_file "app/assets/javascripts/application.js", "//= require twitter_bootstrap\n", :after => "jquery_ujs\n"
          insert_into_file "app/assets/javascripts/application.js", "//= require twitter_bootswatch\n", :after => "twitter_bootstrap\n"
        else
          copy_file "application.js", "app/assets/javascripts/application.js"
        end

        if File.exist?('app/assets/stylesheets/application.css')
          # Add our own require:
          content = File.read("app/assets/stylesheets/application.css")
          if content.match(/require_tree\s+\.\s*$/)
            # Good enough - that'll include our twitter_bootstrap.less
          else
            style_require_block = " *= require twitter_bootstrap\n"
            insert_into_file "app/assets/stylesheets/application.css", style_require_block, :after => "require_self\n"
          end
        else
          copy_file "application.css", "app/assets/stylesheets/application.css"
        end

      end

      def add_bootstrap
        copy_file "bootstrap.coffee", "app/assets/javascripts/twitter_bootstrap.coffee"
        copy_file "bootswatch.coffee", "app/assets/javascripts/twitter_bootswatch.coffee"
        copy_file "bootstrap.less", "app/assets/stylesheets/twitter_bootstrap.less"
        copy_file "bootswatch.less", "app/assets/stylesheets/twitter_bootswatch.less"
      end

    end
  end
end
