# image_downloader_tests

Rspec tests for any web page image downloader implementation testing.

Here are test cases of downloading images defined as:

1. IMG tag with **src** property containing an absolute (http|https) or relative paths
1. IMG tag with **srcset** property containing an absolute (http|https) or relative paths
1. **embedded image** with IMG tag with src property like "data:image/png;base64,iVBORw0KGg..."
1. **background-image** property defined in **style attribute** of any element
1. **background** property defined in **style attribute** of any element
1. **background-image** or **background** property of **style sheet** rule defined in link element
1. **lazily loaded** images appended to DOM on scrolling down the page

Tests are built on **ImageDownloaderAdapter::Base** class which expects **options** as Hash object to be passed to constructor. ImageDownloaderAdapter has single method **run()** which downloads images and saves them to target directory.

Options hash has two keys: `:url` and `:dir`

**NOTE**: Filenames of downloaded images doesn't matter. Files are being checked by their content.

## How to use

To test your image downloader implementation:

clone the repository `git clone git@github.com/Zloy/image_downloader_test.git` 

define the adapter class in `lib/image_downloader_adapter/base.rb` with using your stuff

add to Gemfile your dependencies

`bundle`

`bundle exec rake`

## How to define ImageDownloaderAdapter::Base class

You could wish to test ready to use commandline utility like **wget** or a ruby class or module, Right?

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

```
require ""

module ImageDownloaderAdapter
  class Base
    def initialize(options)
    end
    
    def run
    end
  end
end
```
