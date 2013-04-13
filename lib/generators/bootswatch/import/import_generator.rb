require 'rails/generators'

module Bootswatch
  module Generators
    class ImportGenerator < ::Rails::Generators::NamedBase

      def theme_name
        file_name
      end

      def theme_directory
        if class_path.empty?
          theme_name
        else
          class_path.first
        end
      end

      def theme_repo_url
       "https://raw.github.com/thomaspark/bootswatch/gh-pages/#{theme_name}"
      end

      def import_less

        stylesheets_dest_path = "app/assets/stylesheets/#{theme_directory}"
        empty_directory stylesheets_dest_path

        # let's auto backup if a custom variables.less already exists
        if File.exist?(File.join(stylesheets_dest_path,'variables.less'))
          File.rename(File.join(stylesheets_dest_path,'variables.less'), File.join(stylesheets_dest_path,'variables.less_bak'))
        end

        get File.join(theme_repo_url,'variables.less'), File.join(stylesheets_dest_path,'variables.less')

        # let's auto backup if a custom bootswatch.less already exists
        if File.exist?(File.join(stylesheets_dest_path,'bootswatch.less'))
          File.rename(File.join(stylesheets_dest_path,'bootswatch.less'), File.join(stylesheets_dest_path,'bootswatch.less_bak'))
        end

        get File.join(theme_repo_url,'bootswatch.less'), File.join(stylesheets_dest_path,'bootswatch.less')

        prepend_to_file File.join(stylesheets_dest_path,'bootswatch.less') do
          "@import \"base\";\n"
        end

      end

    end
  end
end
