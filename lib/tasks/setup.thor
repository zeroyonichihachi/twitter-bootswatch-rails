class Setup < Thor
  include Thor::Actions

  desc "use_asset_pipeline", "make less files use asset pipeline"
  def use_asset_pipeline
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

end