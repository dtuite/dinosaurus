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

### Basic

Add your api key using the `configure` method. If you're in the Rails
environemnt then this can be done in an initializer file.

    Dinosaurus.configure do |config|
      config.api_key = 'djksfhjk'
    end

Now, lookup words in the Thesaurus:

    require "dinosaurus"
    results = Dinosaurus.lookup('word')

### Results

The 'results' object is a hash with some special accessors added.

    # You can use it like a normal hash:
    results['noun']
    # => { 'syn' => [..., ..., ...], 'ant' => [..., ...]

    # Or you can access it with symbols.
    results[:noun]
    # => { 'syn' => [..., ..., ...], 'ant' => [..., ...]

    # Or you can take advantage of the special accesor methods. The
    # methods provided are
    #  - synonyms
    #  - antonyms
    #  - related_terms
    #  - similar_terms
    results.synonyms
    # => [..., ..., ...]

### Convenience Methods

Certain convenience methods are provided on the top level namespace.
Each method returns an array.

    Dinosaurus.synonyms_of('word')
    Dinosaurus.anyonyms_of('word')
    Dinosaurus.related_to('word')
    Dinosaurus.similar_to('word')

## Contributing

There is a public [Trello development board](https://trello.com/board/dinosaurus/50128d79aaa25ad30857e434) for the project
which lists ideas and todos. THat might be a good place to start if you would like to contribute.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
