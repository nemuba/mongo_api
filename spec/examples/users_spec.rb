# frozen_string_literal: true

require "spec_helper"

require "byebug"

require_relative "users"

RSpec.describe Users do
  let(:user) { { name: "John Doe", email: "john@gmail.com", type: "DEFAULT" } }

  it { expect(Users.collection_name).to eq("users") }
  it { expect(Users.all).to be_a(Array) }
  it { expect(Users.insert(user)).to be_a(Hash) }

  it "should return a user by name" do
    response = Users.select(filter: user.slice(:name)).first
    expect(response["name"]).to eq("John Doe")
  end

  it "should update user by email" do
    set = { name: "John Doe Updated" }
    response = Users.update(where: user.slice(:email), set:)
    expect(response["modifiedCount"]).to eq(1)
    expect(response["matchedCount"]).to eq(1)
  end

  it "should delete user by email" do
    response = Users.destroy(where: user.slice(:email))
    expect(response["deletedCount"]).to eq(1)
  end

  it "should delete all users" do
    response = Users.destroy_all
    expect(response["deletedCount"]).to be >= 0
  end
end
