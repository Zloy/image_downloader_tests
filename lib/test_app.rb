require 'sinatra'
require 'haml'

class TestApp < Sinatra::Base
  set :bind, '127.0.0.1'
  set :port, proc { ENV['TEST_APP_PORT'].to_i }
  set :root, File.join(File.dirname(__FILE__), '..')
  set :views, proc { File.join(root, 'views') }

  # to avoid a conflict with HTTPClient which leads to the error message:
  # undefined method `run' for HTTP:Module
  set :server, 'webrick'

  get '/' do
    haml :index
  end
end
