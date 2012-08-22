#!/usr/bin/env rake
require 'bundler'
Bundler::GemHelper.install_tasks

desc "Bundle the gem"
task :bundle do
  sh('bundle install')
  sh 'thor setup:use_asset_pipeline'
  sh 'cp vendor/toolkit/twitter/bootstrap/bootstrap.less lib/generators/bootswatch/install/templates/bootstrap.less'
  sh 'cp vendor/toolkit/twitter/bootstrap/variables.less lib/generators/bootswatch/install/templates/variables.less'
  sh 'gem build *.gemspec'
  sh 'gem install *.gem'
  #sh 'rm *.gem'
end

task(:default).clear
task :default => :bundle