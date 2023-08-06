# frozen_string_literal: true

# This class is used to make requests to the cluster mongo-atlas users collection
class Users < MongoApi::Base
  base_url ENV["MONGO_ATLAS_API_URL"]
  default_headers "Content-Type" => "application/json",
                  "api-key" => ENV["MONGO_ATLAS_API_KEY"],
                  "Accept-Control-Allow-Origin" => "*"
end
