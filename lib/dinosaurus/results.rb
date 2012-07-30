require "active_support/core_ext/hash/indifferent_access"

module Dinosaurus
  class Results < HashWithIndifferentAccess

    def initialize(data = {})
      super(data)
    end

    # Define some convenience methods.
    { 'synonyms' => :syn,
      'antonyms' => :ant,
      'similar_terms' => :sim,
      'related_terms' => :rel 
    }.each do |name, key|
      define_method name do
        grouped(key)
      end
    end

  private

    def grouped(key)
      group = []
      self.each do |pos, type|
        group += type[key] if type[key]
      end
      group
    end
  end
end
