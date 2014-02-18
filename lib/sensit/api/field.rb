module Sensit

  module Api

    # .
    #
    # topic_id - The key for the parent topic
    # id - Username of the user
    class Field

      def initialize(topic_id, id, client)
        @topic_id = topic_id
        @id = id
        @client = client
      end

      # Get all the fields associated with a topic. Requires authorization of **read_any_data**, or **read_application_data**
      # '/topics/:topic_id/fields' GET
      #
      def list(options = {})
        body = options.has_key?(:query) ? options[:query] : {}

        response = @client.get "/topics/#{@topic_id}/fields", body, options

        return response
      end

      # Get a Field of the associated a topic and Id. Requires authorization of **read_any_data**, or **read_application_data**
      # '/topics/:topic_id/fields/:id' GET
      #
      def find(options = {})
        body = options.has_key?(:query) ? options[:query] : {}

        response = @client.get "/topics/#{@topic_id}/fields/#{@id}", body, options

        return response
      end

      # Adds a new field that feed data can be added too. Requires authorization of **manage_any_data**, or **manage_application_data**
      # '/topics/:topic_id/fields' POST
      #
      # name - The descriptive name of the field.
      # key - The name that the is used to identify the field in a feed
      def create(name, key, options = {})
        body = options.has_key?(:body) ? options[:body] : {}
        body[:name] = name
        body[:key] = key

        response = @client.post "/topics/#{@topic_id}/fields", body, options

        return response
      end

      # Updates the Field data and makes the corresponding changes in the index. Requires authorization of **manage_any_data**, or **manage_application_data**
      # '/api/topics/:topic_id/fields/:id' PUT
      #
      # name - The descriptive name of the field.
      def update(name, options = {})
        body = options.has_key?(:body) ? options[:body] : {}
        body[:name] = name

        response = @client.put "/api/topics/#{@topic_id}/fields/#{@id}", body, options

        return response
      end

      # Deletes a field and the feed data in that field. Requires authorization of **manage_any_data**, or **manage_application_data**
      # '/api/topics/:topic_id/fields/:id' DELETE
      #
      def delete(options = {})
        body = options.has_key?(:body) ? options[:body] : {}

        response = @client.delete "/api/topics/#{@topic_id}/fields/#{@id}", body, options

        return response
      end

    end

  end

end
