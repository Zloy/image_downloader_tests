require 'sinatra'
require 'haml'

class TestApp < Sinatra::Base
  set :port, ENV['TEST_APP_PORT'].to_i

  # to avoid a conflict with HTTPClient which leads to the error message:
  # undefined method `run' for HTTP:Module
  set :server, 'webrick'
end
