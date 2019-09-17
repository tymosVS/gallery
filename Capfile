# Load DSL and set up stages
require "capistrano/setup"

# Include default deployment tasks
require "capistrano/deploy"


require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

# Include tasks from other gems included in your Gemfile
#
# For documentation on these, see for example:
require 'capistrano/bundler'
require 'capistrano/rvm'
require 'capistrano/rails/assets'

require 'capistrano/rails/migrations'

require 'capistrano/puma'


Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
