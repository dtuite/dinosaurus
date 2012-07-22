# Enable setting and getting of configuration options.
#
# Example:
#
#   This can now be used under config/initializers/dinosaurus.rb
#   Dinosaurus.configure do |config|
#     config.api_key = 'dfskljkf'
#   end

module Dinosaurus
  class Configuration
    DEFAULT_LOG_LEVEL = 'info'

    attr_accessor :api_key, :log_level

    def initialize
      self.log_level = DEFAULT_LOG_LEVEL
    end
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration
  end
end
