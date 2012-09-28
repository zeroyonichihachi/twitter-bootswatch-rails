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
          insert_into_file "app/assets/stylesheets/application.css", " *= require bootswatch/loader\n", :after => "require_self\n"
        else
          copy_file "application.css", "app/assets/stylesheets/application.css"
        end

      end

      def add_javascripts

        javascripts_dest_path = "app/assets/javascripts/bootswatch"
        empty_directory javascripts_dest_path

        template "loader.coffee.tt", File.join(javascripts_dest_path,"loader.coffee")

         # let's auto backup if a custom bootswatch.coffee already exists
        if File.exist?(File.join(javascripts_dest_path,"bootswatch.coffee"))
          File.rename(File.join(javascripts_dest_path,"bootswatch.coffee"), File.join(javascripts_dest_path,"bootswatch.coffee_bak"))
        end
        copy_file "bootswatch.coffee", File.join(javascripts_dest_path,"bootswatch.coffee")

      end

      def add_stylesheets

        stylesheets_dest_path = "app/assets/stylesheets/bootswatch"
        empty_directory stylesheets_dest_path

        less_imports = File.read(find_in_source_paths('bootstrap.less')).scan(Less::Rails::ImportProcessor::IMPORT_SCANNER).flatten.compact.uniq

        template "loader.css.less.tt", File.join(stylesheets_dest_path,"loader.css.less"), {less_imports: less_imports}

        # let's auto backup if a custom variables.less already exists
        if File.exist?(File.join(stylesheets_dest_path,"variables.less"))
          File.rename(File.join(stylesheets_dest_path,"variables.less"), File.join(stylesheets_dest_path,"variables.less_bak"))
        end
        copy_file "variables.less", File.join(stylesheets_dest_path,"variables.less")

        # let's auto backup if a custom bootswatch.less already exists
        if File.exist?(File.join(stylesheets_dest_path,"bootswatch.less"))
          File.rename(File.join(stylesheets_dest_path,"bootswatch.less"), File.join(stylesheets_dest_path,"bootswatch.less_bak"))
        end
        copy_file "bootswatch.less", File.join(stylesheets_dest_path,"bootswatch.less")
      end

    end
  end
end
