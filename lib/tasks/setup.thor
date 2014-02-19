class Setup < Thor
  include Thor::Actions

  desc 'bootstrap_update_asset_pipeline', 'make bootstrap less files use asset pipeline'
  def bootstrap_update_less_files_for_asset_pipeline
    gsub_file 'vendor/toolkit/twitter/bootstrap/variables.less',
              '"../fonts/"',
              '"twitter/bootstrap/"'

    gsub_file 'vendor/toolkit/twitter/bootstrap/glyphicons.less',
              '~"url(',
              'asset-url('

    gsub_file 'vendor/toolkit/twitter/bootstrap/glyphicons.less',
              ')";',
              ');'

    gsub_file 'vendor/toolkit/twitter/bootstrap/glyphicons.less',
              ')",',
              '),'

    gsub_file 'vendor/toolkit/twitter/bootstrap/mixins.less',
              ' url(',
              ' asset-url('

  end

  desc 'bootstrap_update js files compilation order', 'update bootstrap js files compilation order from bootstrap source'
  def bootstrap_update_js_files_compilation_order

    # grab the js files compilation order from bootstrap Makefile
    # line start at first js file line
    # Example:
    #
    #   bootstrap: {
    # src: [
    #   'js/transition.js', # start index at 99 on line 100
    #   'js/alert.js',
    #   'js/button.js',
    #   'js/carousel.js',
    #   'js/collapse.js',
    #   'js/dropdown.js',
    #   'js/modal.js',
    #   'js/tooltip.js',
    #   'js/popover.js',
    #   'js/scrollspy.js',
    #   'js/tab.js',
    #   'js/affix.js' # end index at 110 on line 111
    # ],
    #
    
    lines = IO.readlines('bootstrap/Gruntfile.js')[99..110]
    # clean up array
    js_files = lines.map{|item| item.strip.gsub(/(\'|,|js\/|\.js)/, '')}

    create_file 'lib/generators/bootswatch/install/templates/loader.js.tt', force: true do
%Q{// <%= config[:theme_info] %>
// Bootswatch
// loader.js

<%
js_files = %w[#{js_files.join(' ')}]

js_files.each do |js_file|
%>//= require twitter/bootstrap/<%= js_file %>
<% end %>}
    end

  end

  desc 'bootstrap_update_less_files_with_theme_info', 'update bootstrap less files with theme info'
  def bootstrap_update_less_files_with_theme_info

    prepend_to_file 'lib/generators/bootswatch/install/templates/variables.less.tt' do
      "// <%= config[:theme_info] %>\n// Bootswatch\n\n"
    end

    prepend_to_file 'lib/generators/bootswatch/install/templates/mixins.less.tt' do
      "// <%= config[:theme_info] %>\n// Bootswatch\n\n"
    end

  end

  desc 'remove_imports_from_theme_less', 'remove imports from default bootstrap theme'
  def remove_imports_from_theme_less
    gsub_file 'vendor/toolkit/twitter/bootstrap/theme.less',
              '@import "variables.less";',
              ''

    gsub_file 'vendor/toolkit/twitter/bootstrap/theme.less',
              '@import "mixins.less";',
              ''
  end

end