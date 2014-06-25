###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Markdown
set :markdown_engine, :redcarpet
set :markdown, with_toc_data: false, smartypants: true, footnotes: false, autolink: true, fenced_code_blocks: true

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Compass
compass_config do |config|
  module Sass::Script::Functions
    def random(max = Sass::Script::Number.new(100))
      Sass::Script::Number.new(rand(max.value), max.numerator_units, max.denominator_units)
    end
  end
end

# Reload the browser automatically whenever files change
activate :livereload

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # Minify assets
  activate :minify_css
  activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  activate :relative_assets
  set :relative_links, true
end

# On ready
ready do
  # Add bower's directory to sprockets asset path
  @bower_config = JSON.parse IO.read(File.join(root, ".bowerrc"))
  bower_path = File.join(root, @bower_config["directory"])
  sprockets.append_path bower_path
end
