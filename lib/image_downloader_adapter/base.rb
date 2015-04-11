module ImageDownloaderAdapter
  class Base
    def initialize(options)
      @options = "-r -P #{options[:dir]} -A jpeg,jpg,bmp,gif,png " +
                 options[:url]
    end

    def run
      `wget #{@options}`
    end
  end
end
