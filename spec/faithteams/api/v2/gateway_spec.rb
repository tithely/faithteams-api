# frozen_string_literal: true

RSpec.describe FaithTeams::API::V2::Gateway, type: :model do
  let(:connection) { FaithTeams::API::V2::Connection.new(user_id: "id", password: "pass") }
  let(:gateway) { described_class.new(connection: connection) }

  describe "initialize" do
    it "can be initialized with a connection" do
      expect(gateway).to be_instance_of(described_class)
    end
  end

  describe "batch" do
    it "is a Resource::Batch" do
      expect(gateway.batch).to be_instance_of(FaithTeams::API::V2::Resource::Batch)
    end
  end

  describe "fund" do
    it "is a Resource::Fund" do
      expect(gateway.fund).to be_instance_of(FaithTeams::API::V2::Resource::Fund)
    end
  end

  describe "person" do
    it "is a Resource::Person" do
      expect(gateway.person).to be_instance_of(FaithTeams::API::V2::Resource::Person)
    end
  end

  describe "contribution" do
    it "is a Resource::Contribution" do
      expect(gateway.contribution).to be_instance_of(FaithTeams::API::V2::Resource::Contribution)
    end
  end

  describe "user" do
    it "is a Resource::User" do
      expect(gateway.user).to be_instance_of(FaithTeams::API::V2::Resource::User)
    end
  end

  describe "contribution_type" do
    it "is a Resource::ContributionType" do
      expect(gateway.contribution_type).to be_instance_of(FaithTeams::API::V2::Resource::ContributionType)
    end
  end

  describe "valid_connection?" do
    it "calls connection.valid" do
      expect(connection).to receive(:valid?).and_return(true)
      expect(gateway.valid_connection?).to eq(true)
    end
  end
end
