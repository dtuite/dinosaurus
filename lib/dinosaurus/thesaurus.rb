require "httparty"
require "json"

module Dinosaurus
  class Thesaurus
    include HTTParty
    base_uri "words.bighugelabs.com"
    format :json


    def self.lookup(word)
      res = get(url_for(word))

      if res.code == 200
        { text: word, results: JSON.parse(res.body) }
      else
        warning = "DINOSAURUS_WARNING: #{res.code}. WORD: #{word}."
        Logging.logger.warn(warning)
        { text: word }
      end
    end

  private

    def self.url_for(word)
      "/api/2/" + Dinosaurus.configuration.api_key + '/' + word + '/json'
    end
  end
end
