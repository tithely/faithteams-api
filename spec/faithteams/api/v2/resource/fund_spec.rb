# frozen_string_literal: true

RSpec.configure do |c|
  c.include Support::V2::Stubs, :stubs
end

RSpec.describe FaithTeams::API::V2::Resource::Fund, :stubs, type: :model do
  let(:connection) { FaithTeams::API::V2::Connection.new(user_id: "user_id", password: "password") }
  let(:gateway) { FaithTeams::API::V2::Gateway.new(connection: connection) }

  before do
    allow_any_instance_of(FaithTeams::API::V2::Connection).to receive(:auth_token).and_return("auth_token")
  end

  describe "search" do
    it "returns an array of Entity::Fund if they exist" do
      stub_funds

      expect(gateway.fund.search).to all(be_instance_of(FaithTeams::API::V2::Entity::Fund))
    end

    it "returns an empty array if no funds exist" do
      stub_funds(description: "empty")

      expect(gateway.fund.search).to be_empty
    end
  end
end
