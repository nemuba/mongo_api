# frozen_string_literal: true

require "mongo_api/request"

module MongoApi
  # MongoApi::Base is a class to help you to create a REST API using MongoDB Atlas Data API.
  class Base < Request
    # This method is used to find all documents
    # Example: Mongo::Atlas::Api::Base.all(limit: 100, sort: { _id: 1 })
    #
    # @param [Integer] limit
    # @param [Hash] sort
    # @return [Array|ServiceClient::Response] the documents array or the response
    def self.all(limit: 100, sort: { _id: 1 })
      parse_response { find(limit:, sort:) }
    end

    # This method is used to select documents by filter
    # Example: Mongo::Atlas::Api::Base.select(filter: { name: 'John' }, limit: 100, sort: { _id: 1 })
    #
    # @param [Hash] filter
    # @param [Integer] limit
    # @param [Hash] sort
    # @return [Array|ServiceClient::Response] the documents array or the response
    def self.select(filter:, limit: 100, sort: { _id: 1 })
      parse_response { find(filter:, limit:, sort:) }
    end

    # This method is used to insert one document
    # Example: Mongo::Atlas::Api::Base.insert(document)
    #
    # @param [Hash] document
    # @return [Hash|ServiceClient::Response] the document hash or the response
    def self.insert(document)
      parse_response { insert_one(document) }
    end

    # This method is used to insert many documents
    # Example: Mongo::Atlas::Api::Base.insert_all(documents)
    #
    # @param [Array] documents
    # @return [Array|ServiceClient::Response] the documents array or the response
    def self.insert_all(documents)
      parse_response { insert_many(documents) }
    end

    # This method is used to delete one document
    # Example: Mongo::Atlas::Api::Base.destroy(where: { name: 'John' })
    #
    # @param [Hash] where
    # @return [Hash|ServiceClient::Response] the document hash or the response
    def self.destroy(where: {})
      parse_response { delete_one(filter: where) }
    end

    # This method is used to delete many documents
    # Example: Mongo::Atlas::Api::Base.destroy_all(where: { name: 'John' })
    #
    # @param [Hash] where
    # @return [Hash|ServiceClient::Response] the document hash or the response
    def self.destroy_all(where: {})
      parse_response { delete_many(filter: where) }
    end

    # This method is used to update one document
    # Example: Mongo::Atlas::Api::Base.update(where: { name: 'John' }, set: { name: 'John Doe' })
    #
    # @param [Hash] where
    # @param [Hash] set
    # @return [Hash|ServiceClient::Response] the document hash or the response
    def self.update(where: {}, set: {})
      parse_response { update_one(filter: where, update: { '$set': set }) }
    end

    # This method is used to update many documents
    # Example: Mongo::Atlas::Api::Base.update_all(where: { name: 'John' }, set: { name: 'John Doe' })
    #
    # @param [Hash] where
    # @param [Hash] set
    # @return [Hash|ServiceClient::Response] the document hash or the response
    def self.update_all(where: {}, set: {})
      parse_response { update_many(filter: where, update: { '$set': set }) }
    end

    # This method is used to count documents
    # Example: Mongo::Atlas::Api::Base.count
    #
    # @return [Integer|ServiceClient::Response] the documents count or the response
    def self.size
      count
    end

    class << self
      def body
        {
          database: ENV["MONGO_DATABASE_NAME"],
          collection: ENV["MONGO_COLLECTION_NAME"],
          dataSource: ENV["MONGO_DATASOURCE_NAME"]
        }
      end
    end
  end
end
