module Sensit

  module Api

    # A **Percolator** is a reverse query much like a match rule which is run whenever a new feed is added. These can be used to create alerts by causing the sensit to publish the feed that was just added. A percolator query is defined by a `name` and and valid `query` according to the according the the [elasticsearch Query DSL](http://www.elasticsearch.org/guide/en/elasticsearch/reference/current/query-dsl.html).  For more information about Percolator queries please refer to the [elasticsearch percolator documentation](http://www.elasticsearch.org/guide/en/elasticsearch/reference/current/search-percolate.html).
    #
    # topic_id - The key for the parent topic
    # id - The name of the percolator query
    class Percolator

      def initialize(topic_id, id, client)
        @topic_id = topic_id
        @id = id
        @client = client
      end

      # Returns a list or percolators for a given topic. Requires authorization of **read_any_percolators**, or **read_application_percolators**.
      # '/api/topics/:topic_id/percolators' GET
      #
      def list(options = {})
        body = options.has_key?(:query) ? options[:query] : {}

        response = @client.get "/api/topics/#{@topic_id}/percolators", body, options

        return response
      end

      # Return a specific percolator of the associated Topic by Id. Requires authorization of **read_any_percolators**, or **read_application_percolators**.
      # '/api/topics/:topic_id/percolators/:id' GET
      #
      def find(options = {})
        body = options.has_key?(:query) ? options[:query] : {}

        response = @client.get "/api/topics/#{@topic_id}/percolators/#{@id}", body, options

        return response
      end

      # Create a percolator on the associated Topic with the specified name and query. Requires authorization of **manage_any_percolators**, or **manage_application_percolators**.
      # '/api/topics/:topic_id/percolators' POST
      #
      # percolator - A Hash containing `name`: The name of the percolator(required).`query`: The query hash according to the according the the [elasticsearch Query DSL](http://www.elasticsearch.org/guide/en/elasticsearch/reference/current/query-dsl.html)
      def create(percolator, options = {})
        body = options.has_key?(:body) ? options[:body] : {}
        body[:percolator] = percolator

        response = @client.post "/api/topics/#{@topic_id}/percolators", body, options

        return response
      end

      # Update the query for a specific percolator. Requires authorization of **manage_any_percolators**, or **manage_application_percolators**.
      # '/api/topics/:topic_id/percolators/:id' PUT
      #
      # percolator - A Hash containing the `query` hash according to the according the the [elasticsearch Query DSL](http://www.elasticsearch.org/guide/en/elasticsearch/reference/current/query-dsl.html)
      def update(percolator, options = {})
        body = options.has_key?(:body) ? options[:body] : {}
        body[:percolator] = percolator

        response = @client.put "/api/topics/#{@topic_id}/percolators/#{@id}", body, options

        return response
      end

      # Delete a percolator on the associated topic. Requires authorization of **manage_any_percolators**, or **manage_application_percolators**.
      # '/api/topics/:topic_id/percolators/:id' DELETE
      #
      def delete(options = {})
        body = options.has_key?(:body) ? options[:body] : {}

        response = @client.delete "/api/topics/#{@topic_id}/percolators/#{@id}", body, options

        return response
      end

    end

  end

end
