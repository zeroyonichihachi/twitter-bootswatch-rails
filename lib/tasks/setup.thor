class Setup < Thor
  include Thor::Actions

  desc 'bootstrap_update_asset_pipeline', 'make bootstrap less files use asset pipeline'
  def bootstrap_update_less_files_for_asset_pipeline
    gsub_file 'vendor/toolkit/twitter/bootstrap/variables.less',
              '"../img/glyphicons-halflings.png"',
              '"twitter/bootstrap/glyphicons-halflings.png"'

    gsub_file 'vendor/toolkit/twitter/bootstrap/variables.less',
              '"../img/glyphicons-halflings-white.png"',
              '"twitter/bootstrap/glyphicons-halflings-white.png"'

    gsub_file 'vendor/toolkit/twitter/bootstrap/sprites.less',
              ' url("@{iconSpritePath}")',
              ' asset-url("@{iconSpritePath}")'

    gsub_file 'vendor/toolkit/twitter/bootstrap/sprites.less',
              ' url("@{iconWhiteSpritePath}")',
              ' asset-url("@{iconWhiteSpritePath}")'

  end

  desc 'bootstrap_update js files compilation order', 'update bootstrap js files compilation order from bootstrap source'
  def bootstrap_update_js_files_compilation_order

    # grab the js files compilation order from bootstrap Makefile
    line = IO.readlines('bootstrap/Makefile')[28].split(' ')
    # clean up array
    line.delete_at(0) # => "@cat"
    line.delete_at(-1) # => "docs/assets/js/bootstrap.js"
    line.delete_at(-1) # => ">"
    # remove js/ prefix from file names
    js_files = line.map{|item| item.gsub(/(js\/|\.js)/, '')}

    insert_into_file 'lib/generators/bootswatch/install/templates/loader.coffee.tt', :after => "js_files = %w[\n" do
      js_files.join("\n")
    end

  end

  desc 'bootstrap_responsive_less_file_with_theme_info', 'update responsive less with theme info'
  def bootstrap_responsive_less_file_with_theme_info

    responsive_less_file = 'lib/generators/bootswatch/install/templates/responsive.less.tt'

    gsub_file responsive_less_file,
              '"variables.less"',
              '"<%= config[:theme_name] %>/variables.less"'

    gsub_file responsive_less_file,
              '"mixins.less"',
              '"<%= config[:theme_name] %>/mixins.less"'

    core_reponsive_less_files = %w(
      responsive-utilities.less
      responsive-1200px-min.less
      responsive-768px-979px.less
      responsive-767px-max.less
      responsive-navbar.less
      )

    core_reponsive_less_files.each do |less_file|

      gsub_file responsive_less_file,
                less_file,
                'twitter/bootstrap/'.concat(less_file)

    end

  end

  desc 'bootstrap_update_less_files_with_theme_info', 'update bootstrap less files with theme info'
  def bootstrap_update_less_files_with_theme_info

    prepend_to_file 'lib/generators/bootswatch/install/templates/responsive.less.tt' do
      "// <%= config[:theme_info] %>\n// Bootswatch\n\n"
    end

    prepend_to_file 'lib/generators/bootswatch/install/templates/variables.less.tt' do
      "// <%= config[:theme_info] %>\n// Bootswatch\n\n"
    end

    prepend_to_file 'lib/generators/bootswatch/install/templates/mixins.less.tt' do
      "// <%= config[:theme_info] %>\n// Bootswatch\n\n"
    end

  end

end