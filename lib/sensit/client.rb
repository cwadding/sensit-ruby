require "faraday"
require "json"

require "sensit/api/user"
require "sensit/api/topic"
require "sensit/api/feed"
require "sensit/api/data"
require "sensit/api/percolator"
require "sensit/api/report"
require "sensit/api/subscription"
require "sensit/api/field"

module Sensit

  class Client

    def initialize(auth = {}, options = {})
      @http_client = Sensit::HttpClient::HttpClient.new auth, options
    end

    # <no value>
    #
    def user()
      Sensit::Api::User.new @http_client
    end

    # A topic is root that data is attached to. It is the equivalent of a source in searchlight/solink and acts as a table which has columns(Fields) and rows(Feeds).
    #
    def topic()
      Sensit::Api::Topic.new @http_client
    end

    # Returns api instance to get auxilary information about Buffer useful when creating your app.
    #
    # topic_id - The key for the parent topic
    # id - The id of the feed
    def feed(topic_id, id)
      Sensit::Api::Feed.new topic_id, id, @http_client
    end

    # Get the value of a specific field within a feed
    #
    # topic_id - The key for the parent topic
    # feed_id - The id of the parent feed
    # id - The key of the specific field
    def data(topic_id, feed_id, id)
      Sensit::Api::Data.new topic_id, feed_id, id, @http_client
    end

    # A **Percolator** is a reverse query much like a match rule which is run whenever a new feed is added. These can be used to create alerts by causing the sensit to publish the feed that was just added. A percolator query is defined by a `name` and and valid `query` according to the according the the [elasticsearch Query DSL](http://www.elasticsearch.org/guide/en/elasticsearch/reference/current/query-dsl.html).  For more information about Percolator queries please refer to the [elasticsearch percolator documentation](http://www.elasticsearch.org/guide/en/elasticsearch/reference/current/search-percolate.html).
    #
    # topic_id - The key for the parent topic
    # id - The name of the percolator query
    def percolator(topic_id, id)
      Sensit::Api::Percolator.new topic_id, id, @http_client
    end

    # Reports are stored filter and facet queries on the **Feed** data. A report is a assigned a `name` and the `query` is any elasticsearch query which filters only the desired data for the facets (See the [elasticsearch Query DSL](http://www.elasticsearch.org/guide/en/elasticsearch/reference/current/query-dsl-queries.html) for valid queries). A report can have many `facets` with each facet is referred to by a user defined `name`. Valid `type`'s of facet include **terms**, **range**, **histogram**, **filter**, **statistical**, **query**, **terms_stats**, or **geo_distance**. The `query` within a facet defines the field counts or statistics which the data is calculated over. See the [elasticsearch facet dsl](http://www.elasticsearch.org/guide/en/elasticsearch/reference/current/search-facets.html) for information about the various facet types and valid query fields.
    #
    # topic_id - The key for the parent topic
    # id - The identifier of the report
    def report(topic_id, id)
      Sensit::Api::Report.new topic_id, id, @http_client
    end

    # Subscriptions allows feed data to imported using a socket rather than just using the Feed REST API. By creating a subscription sensit will start to listen for feed data being imported using the specified `host` and while using the topic name as the `channel` name.
    #
    # id - The identifier for the subscription
    def subscription(id)
      Sensit::Api::Subscription.new id, @http_client
    end

    # .
    #
    # topic_id - The key for the parent topic
    # id - Username of the user
    def field(topic_id, id)
      Sensit::Api::Field.new topic_id, id, @http_client
    end

  end

end
