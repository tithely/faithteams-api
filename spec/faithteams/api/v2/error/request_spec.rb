# frozen_string_literal: true

RSpec.describe FaithTeams::API::V2::Error::Request, type: :model do
  let(:failure_message) { "This is an error" }
  let(:response) { double(parse: { "message" => failure_message }) }

  describe "initialize" do
    it "requires response" do
      expect { described_class.new }.to raise_error(ArgumentError, "missing keyword: :response")
    end

    it "allows custom message" do
      expect(described_class.new(response: response, message: "CUSTOM MeSsAgE").message).to eq("CUSTOM MeSsAgE: This is an error")
    end
  end

  describe "failure_message" do
    it "is the error message" do
      expect(described_class.new(response: response).failure_message).to eq(failure_message)
    end

    it "is empty string if not found" do
      expect(described_class.new(response: double(parse: { "message" => "" })).failure_message).to eq("")
    end
  end

  describe "unauthorized?" do
    it "is true if unauthorized message" do
      error = described_class.new(response: double(parse: { "message" => FaithTeams::API::V2::Error::Request::UNAUTHORIZED_ERROR_MESSAGE }))
      expect(error.unauthorized?).to be(true)
    end

    it "is false if not unauthorized message" do
      expect(described_class.new(response: response).unauthorized?).to be(false)
    end
  end

  describe "not_found?" do
    it "is true if not_found message" do
      error = described_class.new(response: double(parse: { "message" => FaithTeams::API::V2::Error::Request::NOT_FOUND_ERROR_MESSAGE }))
      expect(error.not_found?).to be(true)
    end

    it "is false if not not_found message" do
      expect(described_class.new(response: response).not_found?).to be(false)
    end
  end
end
