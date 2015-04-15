# image_downloader_tests

Rspec tests for any web page image downloader implementation testing.

Here are test cases of downloading images defined as:

1. IMG tag with **src** property
1. **embedded image** with IMG tag with src property like "data:image/png;base64,iVBORw0KGg..."
1. **background** or **background-image** property defined in **style attribute** of an element
1. **background** or **background-image** property defined in **style sheet** rule
1. **lazily loaded** images appear on scrolling down the page
1. IMG tag with **srcset** property

**NOTE**: Filenames of downloaded images doesn't matter. Files are checked by their content.

## How it works

Tests are built on **ImageDownloaderAdapter::Base** class which expects **options** as Hash object to be passed to constructor. ImageDownloaderAdapter has single method **run()** which downloads images and saves them to target directory. After files are downloaded, Rspec performs few checkings of what files were not downloaded.

Options hash has two keys: `:url` and `:dir`

```
module ImageDownloaderAdapter
  class Base
    def initialize(options)
    end

    def run
    end
  end
end
```


## How to use

To test your image downloader implementation:

1. clone the repository `git clone git@github.com:Zloy/image_downloader_tests.git` 
2. define the adapter class in `lib/image_downloader_adapter/base.rb` with using your stuff
3. add to Gemfile your dependencies
4. `bundle`
5. `bundle exec rspec`

## How to define ImageDownloaderAdapter::Base class

You could wish to test ready to use commandline utility like **wget** or ruby class or a module, Right?

### In case you got a command line utility like wget

```
module ImageDownloaderAdapter
  class Base
    def initialize(options)
      @options = %Q(-r -P #{options[:dir]} -A jpeg,jpg,bmp,gif,png #{options[:url]})
    end
    
    def run
      `wget #{@options}`
    end
  end
end
```

### In case you wish to test ruby Class or Module

Just like https://github.com/Fotom/image_downloader

Add to Gemfile  `gem 'image_downloader', '~>0.2'`, then `bundle`

```
require 'image_downloader'

module ImageDownloaderAdapter
  class Base
    def initialize(options)
      @downloader = ImageDownloader::Process.new(options[:url], options[:dir])
      @downloader.parse(:any_looks_like_image => true)
    end
    
    def run
      @downloader.download()
    end
  end
end
```

## TODO

1. Convert this repo to a gem
2. Make target class for tests configurable
