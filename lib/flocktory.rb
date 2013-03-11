require 'flocktory/version'
require 'flocktory/base'
require 'flocktory/order'
require 'flocktory/reward'

module Flocktory
  class << self
    def configuration
      @configuration ||= Flocktory::Configuration.new
    end

    def configure
      yield(configuration) if block_given?
    end
  end
end
