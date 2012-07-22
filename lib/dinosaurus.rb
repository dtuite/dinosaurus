require "dinosaurus/logging"
require "dinosaurus/configuration"
require "dinosaurus/thesaurus"
require "dinosaurus/version"

module Dinosaurus
  def self.lookup(word)
    Dinosaurus::Thesaurus.lookup(word)
  end
end
