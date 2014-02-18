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
      # '/subscriptions' GET
      #
      def list(options = {})
        body = options.has_key?(:query) ? options[:query] : {}

        response = @client.get "/subscriptions", body, options

        return response
      end

      # Get the information of a specific subscription. Requires authorization of **read_any_subscriptions**, or **read_application_subscriptions**.
      # '/subscriptions/:id' GET
      #
      def find(options = {})
        body = options.has_key?(:query) ? options[:query] : {}

        response = @client.get "/subscriptions/#{@id}", body, options

        return response
      end

      # Create a subscription which will connect to the server and listen for feed data for any of the associated topics. Requires authorization of **manage_any_subscriptions**, or **manage_application_subscriptions**.
      # '/subscriptions' POST
      #
      # name - The channel or name to identify the subscription.
      # host - The ip address or host of the connection
      # protocol - the protocol to comminivate over
      def create(name, host, protocol, options = {})
        body = options.has_key?(:body) ? options[:body] : {}
        body[:name] = name
        body[:host] = host
        body[:protocol] = protocol

        response = @client.post "/subscriptions", body, options

        return response
      end

      # Returns an object with the current configuration that Buffer is using, including supported services, their icons and the varying limits of character and schedules.  Requires authorization of **manage_any_subscriptions**, or **manage_application_subscriptions**.
      # '/subscriptions/:id' PUT
      #
      # name - The channel or name to identify the subscription.
      # host - The ip address or host of the connection
      # protocol - the protocol to comminivate over
      def update(name, host, protocol, options = {})
        body = options.has_key?(:body) ? options[:body] : {}
        body[:name] = name
        body[:host] = host
        body[:protocol] = protocol

        response = @client.put "/subscriptions/#{@id}", body, options

        return response
      end

      # Delete the subscription and stop listening for feed data for the associated topics. Requires authorization of **manage_any_subscriptions**, or **manage_application_subscriptions**.
      # '/subscriptions/:id' DELETE
      #
      def delete(options = {})
        body = options.has_key?(:body) ? options[:body] : {}

        response = @client.delete "/subscriptions/#{@id}", body, options

        return response
      end

    end

  end

end
