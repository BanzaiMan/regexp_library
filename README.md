[![Build Status](https://travis-ci.org/BanzaiMan/regexp_library.png)](https://travis-ci.org/BanzaiMan/regexp_library)

# RegexpLibrary

RegexpLibrary is a collection of regular expressions for general use.
They are loosely categorized with their primary uses.

## Installation

Add this line to your application's Gemfile:

    gem 'regexp_library'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install regexp_library

## Usage

    require 'regexp_library'

    module Foo
      include RegexpLibrary::IP
    end

## To Do

Add more commonly used regular expressions, such as those found in
Perl's Regexp::Common.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
