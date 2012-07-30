# Dinosaurus [![Build Status](https://secure.travis-ci.org/dtuite/dinosaurus.png?branch=master)](http://travis-ci.org/dtuite/dinosaurus)

Ruby wrapper for the [Big Huge Labs Thesaurus](http://words.bighugelabs.com/) API.

## Installation

Add this line to your application's Gemfile:

    gem 'dinosaurus'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dinosaurus

## Usage

Add your api key using the `configure` method.

    Dinosaurus.configure do |config|
      config.api_key = 'djksfhjk'
    end

Now, lookup words in the Thesaurus:

    require "dinosaurus"

    results = Dinosaurus.lookup('word')

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
