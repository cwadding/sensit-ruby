module Sensit

  module Api

    # Returns api instance to get auxilary information about Buffer useful when creating your app.
    #
    # topic_id - The key for the parent topic
    # id - The id of the feed
    class Feed

      def initialize(topic_id, id, client)
        @topic_id = topic_id
        @id = id
        @client = client
      end

      # Returns a list of feeds for a given topic. Requires authorization of **read_any_data**, or **read_application_data**.
      # '/topics/:topic_id/feeds' GET
      #
      def list(options = {})
        body = options.has_key?(:query) ? options[:query] : {}

        response = @client.get "/topics/#{@topic_id}/feeds", body, options

        return response
      end

      # Returns a specific feed for a topic. Requires authorization of **read_any_data**, or **read_application_data**.
      # '/topics/:topic_id/feeds/:id' GET
      #
      def find(options = {})
        body = options.has_key?(:query) ? options[:query] : {}

        response = @client.get "/topics/#{@topic_id}/feeds/#{@id}", body, options

        return response
      end

      # Create a feed on a given topic. Requires authorization of **read_any_data**, or **read_application_data**.
      # '/topics/:topic_id/feeds' POST
      #
      # data - A hash of data to be stored
      def create(data, options = {})
        body = options.has_key?(:body) ? options[:body] : {}
        body[:data] = data

        response = @client.post "/topics/#{@topic_id}/feeds", body, options

        return response
      end

      # Update an associated Feed to the Topic. Requires authorization of **read_any_data**, or **read_application_data**.
      # '/topics/:topic_id/feeds/:id' PUT
      #
      # data - A hash of data to be stored
      def update(data, options = {})
        body = options.has_key?(:body) ? options[:body] : {}
        body[:data] = data

        response = @client.put "/topics/#{@topic_id}/feeds/#{@id}", body, options

        return response
      end

      # Deletes the desired feed. Requires authorization of **read_any_data**, or **read_application_data**.
      # '/topics/:topic_id/feeds/:id' DELETE
      #
      def delete(options = {})
        body = options.has_key?(:body) ? options[:body] : {}

        response = @client.delete "/topics/#{@topic_id}/feeds/#{@id}", body, options

        return response
      end

    end

  end

end
