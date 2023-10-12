# MongoApi

The gem 'mongo_api' is a simple wrapper around the MongoDb Atlas Data API to make it easier to use in Ruby applications to access data in MongoDb Atlas.

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/mongo_api`. To experiment with that code, run `bin/console` for an interactive prompt.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add mongo_api

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install mongo_api

## Usage

The gem is a simple wrapper around the MongoDb Atlas Data API to make it easier to use in Ruby applications to access data in MongoDb Atlas.

Set environment variables for the MongoDb Atlas API URL, API Key, Database Name, Collection Name and Data Source Name:

```env
MONGO_ATLAS_API_URL=https://cloud.mongodb.com/api/atlas/v1.0
MONGO_ATLAS_API_KEY=1234567890
MONGO_DATABASE_NAME=sample_mflix
MONGO_DATASOURCE_NAME=sample_mflix
```

### Example

```ruby
require 'mongo_api'

class Users < MongoApi::Base
  base_url ENV['MONGO_ATLAS_API_URL']
  default_headers 'Content-Type': 'application/json',
                  'api-key': ENV['MONGO_ATLAS_API_KEY'],
                  'Access-Control-Request-Headers': '*'
end

# Get all users
# @param [Hash] filter: The query predicate.
# @param [Hash] sort: The order in which to return matching documents.
users = Users.all(limit: 10, sort: { _id: 1 }) # => [ { "_id" => "5f9a9a9a9a9a9a9a9a9a9a9a", "name" => "John Doe" }, ... ]

# Insert a new user
# @param [Hash] document: The document to insert.
user = Users.insert({ name: 'Jane Doe' }) # => {"insertedId"=>"64cf1065f549de65c4908375"}

# Find a user by name
# @param [Hash] filter: The query predicate.
# @param [Hash] projection: The fields to return in the matching document.
# @param [Hash] sort: The order in which to return matching documents.
# @param [Integer] limit: The maximum number of documents to return.
user = Users.find(filter: { name: 'Jane Doe' }) # => [ { "_id" => "5f9a9a9a9a9a9a9a9a9a9a9a", "name" => "Jane Doe" } ]

# Update a user
# @param [Hash] where: The query predicate.
# @param [Hash] set: The fields to update in the matching document.
user = Users.update(where: { name: 'Jane Doe' }, set: { name: 'Jane Smith' }) # => {"matchedCount"=>1, "modifiedCount"=>1}

# Update All users
# @param [Hash] where: The query predicate.
# @param [Hash] set: The fields to update in the matching document.
user = Users.update_all(where: { name: 'Jane Smith' }, set: { name: 'Jane Doe' }) # => {"matchedCount"=>1, "modifiedCount"=>1}

# Destroy a user
# @param [Hash] where: The query predicate.
user = Users.destroy(where: { name: 'Jane Smith' }) # => {"deletedCount"=>1}

# Destroy All users
# @param [Hash] where: The query predicate.
user = Users.destroy_all(where: { name: 'Jane Smith' }) # => {"deletedCount"=>1}    

# Count users
user = Users.count # => 10

# Others methods
Users.find_one(filter: {}, :projection: {})
Users.insert_one({})
Users.insert_many([{}, {}])
Users.update_one(filter: {}, :update: {}, upsert: false)
Users.update_many(filter: {}, :update: {}, upsert: false)
Users.delete_one(filter: {})
Users.delete_many(filter: {})
Users.replace_one(filter: {}, replacement: {}, upsert: false)
Users.aggregate(pipeline: [])
Users.count
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/mongo_api.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
