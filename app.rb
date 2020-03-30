require 'sinatra'
require 'sinatra/namespace'
require 'sinatra/respond_with'

require_relative './routes/raw'
require_relative './routes/analysis'
require_relative './routes/engine'

require_relative './lib/config'

set :protection, except: [:path_traversal]
set :strict_paths, false
set :port, Config::PORT
