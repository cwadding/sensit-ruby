module Sensit

  module Api

    # Reports are stored filter and facet queries on the **Feed** data. A report is a assigned a `name` and the `query` is any elasticsearch query which filters only the desired data for the facets (See the [elasticsearch Query DSL](http://www.elasticsearch.org/guide/en/elasticsearch/reference/current/query-dsl-queries.html) for valid queries). A report can have many `facets` with each facet is referred to by a user defined `name`. Valid `type`'s of facet include **terms**, **range**, **histogram**, **filter**, **statistical**, **query**, **terms_stats**, or **geo_distance**. The `query` within a facet defines the field counts or statistics which the data is calculated over. See the [elasticsearch facet dsl](http://www.elasticsearch.org/guide/en/elasticsearch/reference/current/search-facets.html) for information about the various facet types and valid query fields.
    #
    # topic_id - The key for the parent topic
    # id - The identifier of the report
    class Report

      def initialize(topic_id, id, client)
        @topic_id = topic_id
        @id = id
        @client = client
      end

      # Get all reports for the associated Topic. Requires authorization of **read_any_reports**, or **read_application_reports**.
      # '/topics/:topic_id/reports' GET
      #
      def list(options = {})
        body = options.has_key?(:query) ? options[:query] : {}

        response = @client.get "/topics/#{@topic_id}/reports", body, options

        return response
      end

      # Retrieve a specific report on the associated topic by Id. Requires authorization of **read_any_reports**, or **read_application_reports**.
      # '/topics/:topic_id/reports/:id' GET
      #
      def find(options = {})
        body = options.has_key?(:query) ? options[:query] : {}

        response = @client.get "/topics/#{@topic_id}/reports/#{@id}", body, options

        return response
      end

      # Create a new report on the associated Topic which can be easily retrieved later using an id. Requires authorization of **manage_any_reports**, or **manage_application_reports**.
      # '/topics/:topic_id/reports' POST
      #
      # name - The name of the report.
      # query - The search query to filter the data for the facet
      # facets - An array of facet hashes which each contain a `name` ad type of the facet along with its query hash.
      def create(name, query, facets, options = {})
        body = options.has_key?(:body) ? options[:body] : {}
        body[:name] = name
        body[:query] = query
        body[:facets] = facets

        response = @client.post "/topics/#{@topic_id}/reports", body, options

        return response
      end

      # Update the query, facets or name of the report. Requires authorization of **manage_any_reports**, or **manage_application_reports**.
      # '/topics/:topic_id/reports/:id' PUT
      #
      # name - The name of the report.
      # query - The search query to filter the data for the facet
      # facets - An array of facet hashes which each contain a `name` ad type of the facet along with its query hash.
      def update(name, query, facets, options = {})
        body = options.has_key?(:body) ? options[:body] : {}
        body[:name] = name
        body[:query] = query
        body[:facets] = facets

        response = @client.put "/topics/#{@topic_id}/reports/#{@id}", body, options

        return response
      end

      # Remove a saved report on the associated Topic by Id. Requires authorization of **manage_any_reports**, or **manage_application_reports**.
      # '/topics/:topic_id/reports/:id' DELETE
      #
      def delete(options = {})
        body = options.has_key?(:body) ? options[:body] : {}

        response = @client.delete "/topics/#{@topic_id}/reports/#{@id}", body, options

        return response
      end

    end

  end

end
