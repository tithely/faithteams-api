# frozen_string_literal: true

RSpec.configure do |c|
  c.include Support::V2::Stubs, :stubs
end

RSpec.describe FaithTeams::API::V2::Resource::ContributionType, :stubs, type: :model do
  let(:connection) { FaithTeams::API::V2::Connection.new(user_id: "user_id", password: "password") }
  let(:resource) { described_class.new(connection: connection) }

  before do
    allow_any_instance_of(FaithTeams::API::V2::Connection).to receive(:auth_token).and_return("auth_token")
  end

  describe "search" do
    context "when the second party returns the tithely contribution type" do
      before do
        stub_contribution_types
        @search_results = resource.search
      end

      it "the list of contribution types includes the tithely contribution type" do
        tithely_type = @search_results.find(&:tithely?)
        expect(tithely_type).to be_an_instance_of(FaithTeams::API::V2::Entity::ContributionType)
      end
    end

    context "when the second party does not return the tithely contribution type" do
      before do
        stub_contribution_types(description: "without_tithely")
        @search_results = resource.search
      end

      it "the list of contribution types includes the tithely contribution type" do
        expect(@search_results).not_to be_empty
        tithely_type = @search_results.find(&:tithely?)
        expect(tithely_type).to be_nil
      end
    end

    context "when the second party returns 200 but success is false" do
      before do
        stub_contribution_types(description: "error")
      end

      it "raises FaithTeams::API::V2::Error::Request" do
        expect { resource.search }.to raise_error(FaithTeams::API::V2::Error::Request)
      end
    end
  end

  describe "find" do
    it "is an Entity::ContributionType" do
      stub_contribution_type(id: 8004)
      type = resource.find(id: 8004)
      expect(type).to be_instance_of(FaithTeams::API::V2::Entity::ContributionType)
      expect(type.id).to eq(8004)
    end

    it "is nil if batch cannot be found" do
      stub_contribution_type(id: 999999, status: 404, body: "")
      expect(resource.find(id: 999999)).to be_nil
    end

    it "requires an id" do
      expect { resource.find }.to raise_error(ArgumentError, "missing keyword: :id")
    end

    it "is nil if id is blank" do
      expect(resource.find(id: nil)).to be_nil
      expect(resource.find(id: "")).to be_nil
    end
  end
end
