require 'httparty'
require 'flocktory/configuration'

module Flocktory
  class Base
    include HTTParty

    ACCESS_TOKEN_CACHE_KEY = 'flocktory_access_token'.freeze

    base_uri 'https://client.flocktory.com/1'

    class << self
      def access_token
        query = {
          :grant_type    => 'client_credentials',
          :client_id     => Flocktory.configuration.client_id,
          :client_secret => Flocktory.configuration.client_secret
        }

        access_token = Rails.cache.read(ACCESS_TOKEN_CACHE_KEY) if defined?(Rails)

        unless access_token
          response = post('/oauth/token', query: query)

          if defined?(Rails)
            Rails.cache.write(ACCESS_TOKEN_CACHE_KEY, response['access_token'], expires_in: response['expires_in'])
          end

          access_token = response['access_token']
        end

        access_token
      end

      def default_params
        { access_token: access_token }
      end
    end
  end
end
