module Sensit

  module Api

    # A topic is root that data is attached to. It is the equivalent of a source in searchlight/solink and acts as a table which has columns(Fields) and rows(Feeds).
    #
    class Topic

      def initialize(client)
        @client = client
      end

      # Requires authorization of **read_any_data**, or **read_application_data**.
      # '/topics' GET
      #
      def list(options = {})
        body = options.has_key?(:query) ? options[:query] : {}

        response = @client.get "/topics", body, options

        return response
      end

      # Requires authorization of **read_any_data**, or **read_application_data**.
      # '/topics/:id' GET
      #
      def find(options = {})
        body = options.has_key?(:query) ? options[:query] : {}

        response = @client.get "/topics/:id", body, options

        return response
      end

      # Requires authorization of **manage_any_data**, or **manage_application_data**.
      # '/topics' POST
      #
      # name - The name and id of the topic.
      def create(name, options = {})
        body = options.has_key?(:body) ? options[:body] : {}
        body[:name] = name

        response = @client.post "/topics", body, options

        return response
      end

      # Requires authorization of **manage_any_data**, or **manage_application_data**.
      # '/topics/:id' PUT
      #
      # name - The name and id of the topic.
      def update(name, options = {})
        body = options.has_key?(:body) ? options[:body] : {}
        body[:name] = name

        response = @client.put "/topics/:id", body, options

        return response
      end

      # Requires authorization of **manage_any_data**, or **manage_application_data**.
      # '/topics/:id' DELETE
      #
      def delete(options = {})
        body = options.has_key?(:body) ? options[:body] : {}

        response = @client.delete "/topics/:id", body, options

        return response
      end

    end

  end

end
