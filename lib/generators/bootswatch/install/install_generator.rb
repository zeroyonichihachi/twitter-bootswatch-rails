require 'rails/generators'

module Bootswatch
  module Generators
    class InstallGenerator < ::Rails::Generators::NamedBase

      DEFAULT_THEME_NAME='bootswatch'

      argument :name, type: :string, default: DEFAULT_THEME_NAME,
               desc: 'The theme name for this bootswatch'

      # needed for thor templates
      source_root File.expand_path("../templates", __FILE__)

      def theme_name
        file_name
      end

      def use_default_theme_name?
        theme_name === DEFAULT_THEME_NAME
      end

      def theme_info
        "#{use_default_theme_name? ? 'bootstrap'.capitalize : theme_name.capitalize} #{Twitter::Bootswatch::Rails::VERSION.chop.chop}"
      end

      def add_assets

        if use_default_theme_name?
          if File.exist?('app/assets/javascripts/application.js')
            unless File.read('app/assets/javascripts/application.js').include?(theme_name)
              insert_into_file "app/assets/javascripts/application.js",
                             "//= require #{theme_name}/loader\n",
                             :after => "jquery_ujs\n"
            end
          else
            template 'application.js.tt', 'app/assets/stylesheets/application.js', {theme_name: theme_name, theme_info: theme_info}
          end

          if File.exist?('app/assets/stylesheets/application.css')
            unless File.read('app/assets/stylesheets/application.css').include?(theme_name)
              insert_into_file "app/assets/stylesheets/application.css",
                             " *= require #{theme_name}/loader\n",
                             :after => "require_self\n"
            end
          else
            template 'application.css.tt', 'app/assets/stylesheets/application.css', {theme_name: theme_name, theme_info: theme_info}
          end
        else
          template 'application.js.tt', "app/assets/javascripts/#{theme_name}.js", {theme_name: theme_name, theme_info: theme_info}
          template 'application.css.tt', "app/assets/stylesheets/#{theme_name}.css", {theme_name: theme_name, theme_info: theme_info}
        end

      end

      def add_javascripts

        javascripts_dest_path = "app/assets/javascripts/#{theme_name}"
        empty_directory javascripts_dest_path

        template 'loader.coffee.tt', File.join(javascripts_dest_path,'loader.coffee'), {theme_name: theme_name, theme_info: theme_info}

         # let's auto backup if a custom bootswatch.coffee already exists
        if File.exist?(File.join(javascripts_dest_path,'bootswatch.coffee'))
          File.rename(File.join(javascripts_dest_path,'bootswatch.coffee'), File.join(javascripts_dest_path,'bootswatch.coffee_bak'))
        end

        template 'bootswatch.coffee.tt', File.join(javascripts_dest_path,'bootswatch.coffee'), {theme_name: theme_name, theme_info: theme_info}

      end

      def add_stylesheets

        stylesheets_dest_path = "app/assets/stylesheets/#{theme_name}"
        empty_directory stylesheets_dest_path

        less_imports = File.read(find_in_source_paths('bootstrap.less')).scan(Less::Rails::ImportProcessor::IMPORT_SCANNER).flatten.compact.uniq

        template 'loader.css.less.tt', File.join(stylesheets_dest_path,'loader.css.less'), {less_imports: less_imports, theme_name: theme_name, theme_info: theme_info}

        # let's auto backup if a custom variables.less already exists
        if File.exist?(File.join(stylesheets_dest_path,'variables.less'))
          File.rename(File.join(stylesheets_dest_path,'variables.less'), File.join(stylesheets_dest_path,'variables.less_bak'))
        end
        template 'variables.less.tt', File.join(stylesheets_dest_path,'variables.less'), {theme_name: theme_name, theme_info: theme_info}

        # let's auto backup if a custom bootswatch.less already exists
        if File.exist?(File.join(stylesheets_dest_path,'bootswatch.less'))
          File.rename(File.join(stylesheets_dest_path,'bootswatch.less'), File.join(stylesheets_dest_path,'bootswatch.less_bak'))
        end
        template 'bootswatch.less.tt', File.join(stylesheets_dest_path,'bootswatch.less'), {theme_name: theme_name, theme_info: theme_info}

      end

    end
  end
end
