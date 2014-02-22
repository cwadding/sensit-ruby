module Sensit

  module Api

    # Publications are stored actions which are taken when a feed is created, updated, deleted, or there is a matching percolator query.
    #
    # topic_id - The key for the parent topic
    # id - The identifier of the publication
    class Publication

      def initialize(topic_id, id, client)
        @topic_id = topic_id
        @id = id
        @client = client
      end

      # Get all publications for the associated Topic. Requires authorization of **read_any_publications**, or **read_application_publications**.
      # '/api/topics/:topic_id/publications' GET
      #
      def list(options = {})
        body = options.has_key?(:query) ? options[:query] : {}

        response = @client.get "/api/topics/#{@topic_id}/publications", body, options

        return response
      end

      # Retrieve a specific publication on the associated topic by Id. Requires authorization of **read_any_publications**, or **read_application_publications**.
      # '/api/topics/:topic_id/publications/:id' GET
      #
      def find(options = {})
        body = options.has_key?(:query) ? options[:query] : {}

        response = @client.get "/api/topics/#{@topic_id}/publications/#{@id}", body, options

        return response
      end

      # Create a new publication on the associated Topic which can be easily retrieved later using an id. Requires authorization of **manage_any_publications**, or **manage_application_publications**.
      # '/api/topics/:topic_id/publications' POST
      #
      # publication - A Hash containing `host`:The ip address or host of the connection(required).`protocol`:the protocol to communicate over (http, tcp, udp, mqtt) (required)`port`:The port of the connection.
      def create(publication, options = {})
        body = options.has_key?(:body) ? options[:body] : {}
        body[:publication] = publication

        response = @client.post "/api/topics/#{@topic_id}/publications", body, options

        return response
      end

      # Update a publication. Requires authorization of **manage_any_publications**, or **manage_application_publications**.
      # '/api/topics/:topic_id/publications/:id' PUT
      #
      # publication - A Hash containing `host`:The ip address or host of the connection(required).`protocol`:the protocol to communicate over (http, tcp, udp, mqtt) (required)`port`:The port of the connection.
      def update(publication, options = {})
        body = options.has_key?(:body) ? options[:body] : {}
        body[:publication] = publication

        response = @client.put "/api/topics/#{@topic_id}/publications/#{@id}", body, options

        return response
      end

      # Remove a saved publication on the associated Topic by Id. Requires authorization of **manage_any_publications**, or **manage_application_publications**.
      # '/api/topics/:topic_id/publications/:id' DELETE
      #
      def delete(options = {})
        body = options.has_key?(:body) ? options[:body] : {}

        response = @client.delete "/api/topics/#{@topic_id}/publications/#{@id}", body, options

        return response
      end

    end

  end

end
