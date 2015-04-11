require 'helpers/test_app'

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
    ENV['TEST_APP_PORT'] = @port.to_s

    @child_pid = Process.fork do |_f|
      require 'helpers/test_app'

      TestApp.run!
    end

    sleep 1 # wait for sinatra starting up
  end

  def stop
    return unless @child_pid

    Process.kill 'TERM', @child_pid
    Process.wait @child_pid
  end
end
