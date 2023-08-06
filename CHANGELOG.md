# [Release]

## [0.1.0] - 2023-08-05

- Initial release
- Add class `MongoApi::Request` and `MongoApi::Base` to handle requests to the API and to handle requests to the database in a simple way on MongoDb Atlas Data API.
- `MongoApi::Request` methods:
  - `#find_one`: returns a document from a collection by filter and projection
  - `#insert_one`: inserts a document into a collection
  - `#insert_many`: inserts multiple documents into a collection
  - `#update_one`: updates a document from a collection by filter
  - `#update_many`: updates multiple documents from a collection by filter
  - `#replace_one`: replaces a document from a collection by filter
  - `#delete_one`: deletes a document from a collection by filter
  - `#delete_many`: deletes multiple documents from a collection by filter
- `MongoApi::Base` methods:
  - `#all`: returns all documents from a collection
  - `#find`: returns a document from a collection by filter, projection, sort and limit
  - `#insert`: inserts a document into a collection
  - `#update`: updates a document from a collection by filter
  - `#replace`: replaces a document from a collection by filter
  - `#destroy`: deletes a document from a collection by filter
