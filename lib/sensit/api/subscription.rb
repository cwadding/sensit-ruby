module Sensit

  module Api

    # Subscriptions allows feed data to imported using a socket rather than just using the Feed REST API. By creating a subscription sensit will start to listen for feed data being imported using the specified `host` and while using the topic name as the `channel` name.
    #
    # id - The identifier for the subscription
    class Subscription

      def initialize(id, client)
        @id = id
        @client = client
      end

      # Get the list of all subscriptions for importing feed data to the associated topics. Requires authorization of **read_any_subscriptions**, or **read_application_subscriptions**.
      # '/api/subscriptions' GET
      #
      def list(options = {})
        body = options.has_key?(:query) ? options[:query] : {}

        response = @client.get "/api/subscriptions", body, options

        return response
      end

      # Get the information of a specific subscription. Requires authorization of **read_any_subscriptions**, or **read_application_subscriptions**.
      # '/api/subscriptions/:id' GET
      #
      def find(options = {})
        body = options.has_key?(:query) ? options[:query] : {}

        response = @client.get "/api/subscriptions/#{@id}", body, options

        return response
      end

      # Create a subscription which will connect to the server and listen for feed data for any of the associated topics. Requires authorization of **manage_any_subscriptions**, or **manage_application_subscriptions**.
      # '/api/subscriptions' POST
      #
      # subscription - A Hash containing`name`:The channel or name to identify the subscription(required).`host`:The ip address or host of the connection(required).`protocol`:the protocol to communicate over (http, tcp, udp, mqtt) (required)`port`:The port of the connection.
      def create(subscription, options = {})
        body = options.has_key?(:body) ? options[:body] : {}
        body[:subscription] = subscription

        response = @client.post "/api/subscriptions", body, options

        return response
      end

      # Returns an object with the current configuration that Buffer is using, including supported services, their icons and the varying limits of character and schedules.  Requires authorization of **manage_any_subscriptions**, or **manage_application_subscriptions**.
      # '/api/subscriptions/:id' PUT
      #
      # subscription - A Hash containing`name`:The channel or name to identify the subscription(required).`host`:The ip address or host of the connection(required).`protocol`:the protocol to communicate over (http, tcp, udp, mqtt) (required)`port`:The port of the connection.
      def update(subscription, options = {})
        body = options.has_key?(:body) ? options[:body] : {}
        body[:subscription] = subscription

        response = @client.put "/api/subscriptions/#{@id}", body, options

        return response
      end

      # Delete the subscription and stop listening for feed data for the associated topics. Requires authorization of **manage_any_subscriptions**, or **manage_application_subscriptions**.
      # '/api/subscriptions/:id' DELETE
      #
      def delete(options = {})
        body = options.has_key?(:body) ? options[:body] : {}

        response = @client.delete "/api/subscriptions/#{@id}", body, options

        return response
      end

    end

  end

end
