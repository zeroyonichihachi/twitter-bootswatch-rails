require 'rails/generators'

module Bootswatch
  module Generators
    class InstallGenerator < ::Rails::Generators::Base

      source_root File.expand_path("../templates", __FILE__)
      desc "This generator installs Twitter Bootstrap to Asset Pipeline"

      def add_assets

        if File.exist?('app/assets/javascripts/application.js')
          insert_into_file "app/assets/javascripts/application.js", "//= require bootswatch/loader\n", :after => "jquery_ujs\n"
        else
          copy_file "application.js", "app/assets/javascripts/application.js"
        end

        if File.exist?('app/assets/stylesheets/application.css')
          # Add our own require:
          content = File.read("app/assets/stylesheets/application.css")
          insert_into_file "app/assets/stylesheets/application.css", " *= require bootswatch/loader\n", :after => "require_self\n"
        else
          copy_file "application.css", "app/assets/stylesheets/application.css"
        end

      end

      def add_bootstrap
        empty_directory "app/assets/javascripts/bootswatch"
        copy_file "loader.coffee", "app/assets/javascripts/bootswatch/loader.coffee"
        copy_file "swatch.coffee", "app/assets/javascripts/bootswatch/swatch.coffee"

        empty_directory "app/assets/stylesheets/bootswatch"
        copy_file "loader.less", "app/assets/stylesheets/bootswatch/loader.less"
        copy_file "base.less", "app/assets/stylesheets/bootswatch/base.less"
        copy_file "variables.less", "app/assets/stylesheets/bootswatch/variables.less"
        copy_file "swatch.less", "app/assets/stylesheets/bootswatch/swatch.less"
      end

    end
  end
end
