require "dinosaurus/logging"
require "dinosaurus/configuration"
require "dinosaurus/thesaurus"
require "dinosaurus/version"

module Dinosaurus
  def self.lookup(word)
    Dinosaurus::Thesaurus.lookup(word)
  end

  def self.synonyms_of(word)
    Dinosaurus::Thesaurus.synonyms_of(word)
  end
end
