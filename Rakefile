#!/usr/bin/env rake
require 'bundler'
Bundler::GemHelper.install_tasks

desc "Configure then bundle the gem"
task :bundle do

  sh 'bundle install'

  ## begin bootstrap config ##

  sh 'rm -f vendor/assets/images/twitter/bootstrap/*.png'
  sh 'cp -f bootstrap/img/*.png vendor/assets/images/twitter/bootstrap'

  sh 'rm -f vendor/assets/javascripts/twitter/bootstrap/*.js'
  sh 'cp -f bootstrap/js/bootstrap-*.js vendor/assets/javascripts/twitter/bootstrap'

  sh 'rm -f vendor/toolkit/twitter/bootstrap/*.less'
  sh 'cp -f bootstrap/less/*.less vendor/toolkit/twitter/bootstrap'

  sh 'thor setup:bootstrap_update_less_files_for_asset_pipeline'
  sh 'thor setup:bootstrap_update_js_files_compilation_order'

  sh 'cp -f vendor/toolkit/twitter/bootstrap/bootstrap.less lib/generators/bootswatch/install/templates/bootstrap.less'
  sh 'cp -f vendor/toolkit/twitter/bootstrap/variables.less lib/generators/bootswatch/install/templates/variables.less.tt'
  sh 'cp -f vendor/toolkit/twitter/bootstrap/mixins.less lib/generators/bootswatch/install/templates/mixins.less.tt'

  sh 'thor setup:bootstrap_update_less_files_with_theme_info'

  ## end bootstrap config ##

  ## begin font-awesome config ##

  sh 'rm -f vendor/assets/fonts/font-awesome/*.*'
  sh 'cp -f font-awesome/font/*.* vendor/assets/fonts/font-awesome'

  sh 'rm -f vendor/toolkit/font-awesome/*.less'
  sh 'cp -f font-awesome/less/*.less vendor/toolkit/font-awesome'

  sh 'thor setup:fontawesome_update_less_files_for_asset_pipeline'

  ## end font-awesome config ##

  sh 'gem build *.gemspec'
  sh 'gem install *.gem'

end

task(:default).clear
task :default => :bundle

desc "Clean up files"
task :clean do

  sh 'rm *.gem'

end