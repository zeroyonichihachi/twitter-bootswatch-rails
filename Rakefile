#!/usr/bin/env rake
require 'bundler'
Bundler::GemHelper.install_tasks

desc "Bundle the gem"
task :bundle do
  sh('bundle install')

  sh 'rm vendor/toolkit/twitter/bootstrap/*.less'
  sh 'cp bootstrap/less/*.less vendor/toolkit/twitter/bootstrap'

  sh 'rm vendor/assets/javascripts/twitter/bootstrap/*.js'
  sh 'cp bootstrap/js/bootstrap-*.js vendor/assets/javascripts/twitter/bootstrap'

  sh 'thor setup:use_asset_pipeline'
  sh 'thor setup:update_js_files_compilation_order'

  sh 'cp vendor/toolkit/twitter/bootstrap/bootstrap.less lib/generators/bootswatch/install/templates/bootstrap.less'
  sh 'cp vendor/toolkit/twitter/bootstrap/variables.less lib/generators/bootswatch/install/templates/variables.less'
  sh 'gem build *.gemspec'
  sh 'gem install *.gem'
  # sh 'rm *.gem'
end

task(:default).clear
task :default => :bundle