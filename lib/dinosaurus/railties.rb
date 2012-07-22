module Dinosaurus
  class Railties < ::Rails::Railtie
    initializer 'Rails logger' do
      Dinosaurus::Logging.logger = Rails.logger
    end
  end
end
