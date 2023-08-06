# frozen_string_literal: true

RSpec.describe MongoApi do
  it "has a version number" do
    expect(MongoApi::VERSION).not_to be nil
  end

  it "has a class MongoApi::Request" do
    expect(MongoApi::Request).not_to be nil
  end

  it "has a class MongoApi::Base" do
    expect(MongoApi::Base).not_to be nil
  end
end
