require 'rails'

module Twitter
  module Bootswatch
    module Rails
      class Engine < ::Rails::Engine

        initializer 'twitter-bootswatch-rails.setup',
          :after => 'less-rails.after.load_config_initializers', 
          :group => :all do |app|
          app.config.less.paths << File.join(config.root, 'vendor', 'toolkit')
          end

        initializer 'twitter-bootswatch-rails.setup_helpers' do |app|
          app.config.to_prepare do

          end
        end
      end
    end
  end
end
