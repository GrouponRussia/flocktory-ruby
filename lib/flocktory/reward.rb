module Flocktory
  class Reward < Base
    class << self
      def all(params = {})
        get('/rewards', query: default_params.merge(params))
      end

      def update(params = {})
        put('/rewards', query: default_params.merge(params))
      end
    end
  end
end
