require 'debugger'
require 'helpers/test_app_starter'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:all) do
    @app = TestAppStarter.new(4567) # port

    trap('SIGINT') do
      @app.stop
      exit(-1)
    end

    @app.start
  end

  config.after(:all) do
    @app.stop
  end
end

require 'image_downloader_adapter'
