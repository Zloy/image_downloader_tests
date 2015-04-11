require 'test_app_starter.rb'

namespace :idt do # idt stands for Image Downloader Test
  desc 'Start test sinatra application, port default is 4567'
  task :start_app, :port do |_t, args|
    args.with_defaults(port: 4567)
    app = TestAppStarter.new(args[:port].to_i)
    app.start
    app.wait
  end
end
