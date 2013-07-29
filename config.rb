###
# Compass
###

# Susy grids in Compass
# First: gem install susy
 require 'susy'
 require 'modular-scale'
 require 'animate'

activate :livereload
activate :directory_indexes


# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

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

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"z
#   end
# end

set :css_dir, 'css'

set :js_dir, 'js'

set :images_dir, 'img'

deploy_config = YAML::load(File.open('deploy-config.yml'))

activate :deploy do |deploy|
  deploy.method = :rsync
  deploy.user   = deploy_config['user']
  deploy.host   = deploy_config['host']
  deploy.path   = deploy_config['path']
  deploy.build_before = false # default: false
end

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :cache_buster

  # Use relative URLs
  activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  require "middleman-smusher"
  activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end