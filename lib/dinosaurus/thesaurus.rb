require "httparty"
require "json"
require "uri"
require "active_support/core_ext/object/blank"

module Dinosaurus
  class MissingApiKeyError < StandardError; end
  class RemoteServiceError < StandardError; end

  class Thesaurus
    include HTTParty
    base_uri "words.bighugelabs.com"
    format :json

    def self.lookup(word)
      return Dinosaurus::Results.new if word.blank?
      res = get(url_for(word))

      if res.code == 200
        json = JSON.parse(res.body)
        Dinosaurus::Results.new(json)
      # Word does not exist.
      elsif res.code == 404
        Dinosaurus::Results.new
      else
        warning = "DINOSAURUS_WARNING: #{res.code}. WORD: #{word}."
        Logging.logger.warn(warning)
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
