require "dinosaurus/logging"
require "dinosaurus/configuration"
require "dinosaurus/results"
require "dinosaurus/thesaurus"
require "dinosaurus/version"

module Dinosaurus
  def self.lookup(word)
    Dinosaurus::Thesaurus.lookup(word)
  end

  def self.synonyms_of(word)
    results = lookup(word)
    results.synonyms
  end

  def self.antonyms_of(word)
    results = lookup(word)
    results.antonyms
  end

  def self.similar_to(word)
    results = lookup(word)
    results.similar_terms
  end

  def self.related_to(word)
    results = lookup(word)
    results.related_terms
  end
end
