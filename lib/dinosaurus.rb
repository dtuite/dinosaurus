require "dinosaurus/logging"
require "dinosaurus/configuration"
require "dinosaurus/results"
require "dinosaurus/thesaurus"
require "dinosaurus/version"

module Dinosaurus
  # Lookup a word in the Big Huge Thesaurus. 
  #
  # +word+ is expected to be a string. This method is 
  # a no-op if the +word+ is blank as defined by ActiveSupport.
  #
  #   Dinosaurus.lookup('people')
  #
  # Returns an instance of <tt>Dinosaurus::Results</tt>
  def self.lookup(word)
    Dinosaurus::Thesaurus.lookup(word)
  end

  # Convenience method to retrieve synonyms of a +word+.
  #
  #   Dinosaurus.synonyms_of('people')
  #
  # Returns an array.
  def self.synonyms_of(word)
    results = lookup(word)
    results.synonyms
  end

  # Convenience method to retrieve antonyms of a +word+.
  #
  #   Dinosaurus.antonyms_of('people')
  #
  # Returns an array.
  def self.antonyms_of(word)
    results = lookup(word)
    results.antonyms
  end

  # Convenience method to retrieve similar terms to the
  # given +word+.
  #
  #   Dinosaurus.similar_to('people')
  #
  # Returns an array.
  def self.similar_to(word)
    results = lookup(word)
    results.similar_terms
  end

  # Convenience method to retrieve terms which are
  # related to the given +word+.
  #
  #   Dinosaurus.related_to('people')
  #
  # Returns an array.
  def self.related_to(word)
    results = lookup(word)
    results.related_terms
  end
end
