require 'test_app'

class TestAppStarter
  def initialize(port)
    @port = port
  end

  def root_url
    "http://localhost:#{@port}"
  end

  def self.process(port, dry_run = false, &block)
    app = new port
    unless dry_run
      app.start
      sleep 1 # wait for sinatra starting up
    end

    block.call app.root_url
  ensure
    app.stop
  end

  def start
    trap('SIGINT') { stop }

    @pid = Process.fork do |_f|
      ENV['TEST_APP_PORT'] = @port.to_s
      TestApp.run!
    end
  end

  def stop
    Process.kill('TERM', @pid) if @pid
  end

  def wait
    Process.wait @pid if @pid
  end
end
