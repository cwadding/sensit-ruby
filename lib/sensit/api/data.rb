module Sensit

  module Api

    # Get the value of a specific field within a feed
    #
    # topic_id - The key for the parent topic
    # feed_id - The id of the parent feed
    # id - The key of the specific field
    class Data

      def initialize(topic_id, feed_id, id, client)
        @topic_id = topic_id
        @feed_id = feed_id
        @id = id
        @client = client
      end

      # Requires authorization of **read_any_data**, or **read_application_data**.
      # '/topics/:topic_id/feeds/:feed_id/data/:id' GET
      #
      def find(options = {})
        body = options.has_key?(:query) ? options[:query] : {}

        response = @client.get "/topics/#{@topic_id}/feeds/#{@feed_id}/data/#{@id}", body, options

        return response
      end

      # Update a specific value of a field within a feed with the data passed in. Requires authorization of **read_any_data**, or **read_application_data**.
      # '/topics/:topic_id/feeds/:feed_id/data/:id' PUT
      #
      def update(options = {})
        body = options.has_key?(:body) ? options[:body] : {}

        response = @client.put "/topics/#{@topic_id}/feeds/#{@feed_id}/data/#{@id}", body, options

        return response
      end

    end

  end

end
