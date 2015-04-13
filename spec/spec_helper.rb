require 'debugger'
require 'test_app_starter'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:all) do
    @source_dir = File.expand_path '../public/images'
    @target_dir = File.expand_path Dir.tmpdir
    TestAppStarter.process(4567) do |root_url|
      adapter = ImageDownloaderAdapter::Base.new(url: root_url,
                                                 dir: @target_dir)
      adapter.run
    end
  end

  config.after(:all) do
    FileUtils.rm_rf(@target_dir) if File.exist?(@target_dir)
  end
end

require 'image_downloader_adapter'
