module Sensit

  module Api

    # A topic is root that data is attached to. It is the equivalent of a source in searchlight/solink and acts as a table which has columns(Fields) and rows(Feeds).
    #
    class Topic

      def initialize(client)
        @client = client
      end

      # Requires authorization of **read_any_data**, or **read_application_data**.
      # '/api/topics' GET
      #
      def list(options = {})
        body = options.has_key?(:query) ? options[:query] : {}

        response = @client.get "/api/topics", body, options

        return response
      end

      # Requires authorization of **read_any_data**, or **read_application_data**.
      # '/api/topics/:id' GET
      #
      def find(options = {})
        body = options.has_key?(:query) ? options[:query] : {}

        response = @client.get "/api/topics/:id", body, options

        return response
      end

      # Requires authorization of **manage_any_data**, or **manage_application_data**.
      # '/api/topics' POST
      #
      # topic - A hash containing the name/id of the topic (required) and a description of the topic.
      def create(topic, options = {})
        body = options.has_key?(:body) ? options[:body] : {}
        body[:topic] = topic

        response = @client.post "/api/topics", body, options

        return response
      end

      # Requires authorization of **manage_any_data**, or **manage_application_data**.
      # '/api/topics/:id' PUT
      #
      # topic - A hash containing the name/id of the topic (required) and a description of the topic.
      def update(topic, options = {})
        body = options.has_key?(:body) ? options[:body] : {}
        body[:topic] = topic

        response = @client.put "/api/topics/:id", body, options

        return response
      end

      # Requires authorization of **manage_any_data**, or **manage_application_data**.
      # '/api/topics/:id' DELETE
      #
      def delete(options = {})
        body = options.has_key?(:body) ? options[:body] : {}

        response = @client.delete "/api/topics/:id", body, options

        return response
      end

    end

  end

end
