require "httparty"
require "json"
require "uri"

module Dinosaurus
  class MissingApiKeyError < StandardError; end

  class Thesaurus
    include HTTParty
    base_uri "words.bighugelabs.com"
    format :json

    def self.synonyms_of(word)
      lookup = lookup(word)

      synonyms = []
      lookup[:results].each do |part_of_speech, types|
        synonyms += types['syn'] if types['syn']
        synonyms += types['sim'] if types['sim']
        synonyms += types['rel'] if types['rel']
      end
      synonyms
    end

    def self.lookup(word)
      res = get(url_for(word))

      if res.code == 200
        { text: word, results: JSON.parse(res.body) }
      # Word does not exist.
      elsif res.code == 404
        { text: word, results: [] }
      else
        warning = "DINOSAURUS_WARNING: #{res.code}. WORD: #{word}."
        Logging.logger.warn(warning)
        { text: word }
      end
    end

  private

    def self.url_for(word)
      key = Dinosaurus.configuration.api_key
      raise MissingApiKeyError unless key
      URI.encode("/api/2/" + key + '/' + word + '/json')
    end
  end
end
