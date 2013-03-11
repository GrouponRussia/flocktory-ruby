module Flocktory
  class Order < Base
    class << self
      def all(params = {})
        get('/orders', query: default_params.merge(params))
      end

      def update(params = {})
        put('/orders', body: default_params.merge(params))
      end
    end
  end
end
