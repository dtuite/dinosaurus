require "logger"

module Logging
  def logger
    Logging.logger
  end

  def self.logger
    unless @logger
      @logger = Logger.new(STDOUT)
      @logger.level = Logging.infer_level
    end
    @logger
  end

  # infer a suitable Log level from the ENVIRONMENT variable
  # Can pass in an environment value for testing purposes
  def self.infer_level(level = nil)
    level = level || Dinosaurus.configuration.log_level
    case level
    when 'debug' then Logger::DEBUG
    when 'warn' then Logger::WARN
    else Logger::INFO # default
    end
  end
end
