module Flocktory
  class Configuration
    attr_accessor :client_id, :client_secret

    def initialize
      @client_id     = ENV['FLOCKTORY_CLIENT_ID']
      @client_secret = ENV['FLOCKTORY_CLIENT_SECRET']
    end
  end
end
