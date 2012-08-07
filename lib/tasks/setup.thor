class Setup < Thor
  include Thor::Actions

  desc "use_asset_pipeline", "make less files use asset pipeline"
  def use_asset_pipeline
    gsub_file 'vendor/toolkit/twitter/bootstrap/variables.less',
              '"../img/glyphicons-halflings.png"',
              "asset-path('twitter/bootstrap/glyphicons-halflings.png')"

    gsub_file 'vendor/toolkit/twitter/bootstrap/variables.less',
              '"../img/glyphicons-halflings-white.png"',
              "asset-path('twitter/bootstrap/glyphicons-halflings-white.png')"
  end

end