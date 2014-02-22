module Sensit

  module Api

    # <no value>
    #
    class User

      def initialize(client)
        @client = client
      end

      # <no value>
      # '/api/user' GET
      #
      def profile(options = {})
        body = options.has_key?(:query) ? options[:query] : {}

        response = @client.get "/api/user", body, options

        return response
      end

    end

  end

end
