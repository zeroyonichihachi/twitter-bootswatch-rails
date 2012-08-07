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
        template "loader.coffee.tt", "app/assets/javascripts/bootswatch/loader.coffee"
        copy_file "bootswatch.coffee", "app/assets/javascripts/bootswatch/bootswatch.coffee"

        empty_directory "app/assets/stylesheets/bootswatch"

        less_imports = File.read(find_in_source_paths('bootstrap.less')).scan(Less::Rails::ImportProcessor::IMPORT_SCANNER).flatten.compact.uniq
        template "loader.less.tt", "app/assets/stylesheets/bootswatch/loader.less", {less_imports: less_imports}

        copy_file "base.less", "app/assets/stylesheets/bootswatch/base.less"
        copy_file "variables.less", "app/assets/stylesheets/bootswatch/variables.less"
        copy_file "bootswatch.less", "app/assets/stylesheets/bootswatch/bootswatch.less"
      end

    end
  end
end
