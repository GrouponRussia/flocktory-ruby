require 'httparty'
require 'flocktory/configuration'

module Flocktory
  class Base
    include HTTParty

    base_uri 'https://client.flocktory.com/1'

    class << self
      def access_token
        query = {
          :grant_type    => 'client_credentials',
          :client_id     => Flocktory.configuration.client_id,
          :client_secret => Flocktory.configuration.client_secret
        }

        response = post('/oauth/token', query: query)

        response['access_token']
      end

      def default_params
        { access_token: access_token }
      end
    end
  end
end
