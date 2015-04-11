require 'test_app'

class TestAppStarter
  def initialize(port)
    @port = port
  end

  def root_url
    "http://localhost:#{@port}"
  end

  def self.process(port, dry_run = false & block)
    app = new port
    app.start unless dry_run
    yield app.root_url
  ensure
    app.stop
  end

  def start
    trap('SIGINT') do
      stop
    end

    @pid = Process.fork do |_f|
      ENV['TEST_APP_PORT'] = @port.to_s
      TestApp.run!
    end

    sleep 1 # wait for sinatra starting up
  end

  def stop
    return unless @pid

    Process.kill 'TERM', @pid
    Process.wait @pid
  end

  def wait
    Process.wait @pid
  end
end
