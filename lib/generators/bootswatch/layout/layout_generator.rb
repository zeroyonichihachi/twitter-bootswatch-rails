require 'rails/generators'

module Bootswatch
  module Generators
    class LayoutGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)
      desc "This generator generates layout file with navigation."
      argument :layout_name, :type => :string, :default => "application"

      attr_reader :app_name, :container_class

      def generate_layout
        app = ::Rails.application
        ext = app.config.generators.options[:rails][:template_engine] || :erb
        template "layout.html.#{ext}", "app/views/layouts/#{layout_name}.html.#{ext}"
      end
    end
  end
end
