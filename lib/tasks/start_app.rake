require 'test_app_starter.rb'

namespace :idt do # idt stands for Image Downloader Test
  desc 'Start test sinatra application'
  task :start_app do
    app = TestAppStarter.new(4567)
    app.start
    app.wait
  end
end
