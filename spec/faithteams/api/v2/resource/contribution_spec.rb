# frozen_string_literal: true

RSpec.configure do |c|
  c.include Support::V2::Stubs, :stubs
end

RSpec.describe FaithTeams::API::V2::Resource::Contribution, :stubs, type: :model do
  let(:connection) { FaithTeams::API::V2::Connection.new(user_id: "user_id", password: "password") }
  let(:gateway) { FaithTeams::API::V2::Gateway.new(connection: connection) }

  before do
    allow_any_instance_of(FaithTeams::API::V2::Connection).to receive(:auth_token).and_return("auth_token")
  end

  describe "create" do
    let(:contribution) { FaithTeams::API::V2::Entity::Contribution.new(attributes: [
      {
        "contributionId" => 4281056,
        "parentId" => 4281056,
        "recordType" => "H",
        "personId" => 769839,
        "batchId" => 182136,
        "sortIndex" => 0,
        "amount" => 100,
        "fee" => "2",
        "netAmount" => "98.00",
        "contributionTypeId" => 24,
        "fundId" => 0,
        "checkNumber" => "",
        "status" => "A",
        "note" => "for the dogs",
        "createdDtm" => "2023-04-18 11:07:44",
        "createdUser" => 27850,
        "updatedDtm" => "2023-04-18 11:07:44",
        "updatedUser" => 27850,
        "giveDtm" => "2023-04-16 00:00:00",
        "strAmount" => "$100.00",
        "strFee" => "$2.00"
      },
      {
        "batchId" => 182136,
        "personId" => 769839,
        "amount" => 100,
        "fee" => "2",
        "netAmount" => "98.00",
        "fundId" => 7833,
        "recordType" => "D"
      }
    ]) }

    it "returns contribution if successfully created" do
      stub_contributions_create

      created = gateway.contribution.create(entity: contribution)

      expect(created).to be_instance_of(FaithTeams::API::V2::Entity::Contribution)
    end

    it "raises Error::Request with reason if contribution could not be created" do
      stub_contributions_create(status: 200, description: "error")

      expect do
        gateway.contribution.create(entity: contribution)
      end.to raise_error(FaithTeams::API::V2::Error::Request) do |error|
        expect(error.message).to match(/Request Unsuccessful: The contribution #<.*> could not be created./)
      end
    end
  end

  describe "find" do
    it "returns existing contribution when given id" do
      stub_contributions_find(parent_id: 4299555)
      contribution = gateway.contribution.find(id: 4299555)
      expect(contribution).to be_instance_of(FaithTeams::API::V2::Entity::Contribution)
      expect(contribution.records.first.parent_id).to eq(4299555)
    end

    it "returns nil if contribution cannot be found" do
      stub_contributions_find(parent_id: 183100, description: "empty")
      contribution = gateway.contribution.find(id: 183100)
      expect(contribution).to be_nil
    end

    it "requires an id" do
      stub_contributions_find(parent_id: 183100)
      expect { gateway.contribution.find }.to raise_error(ArgumentError, "missing keyword: :id")
      expect { gateway.contribution.find(id: nil) }.to raise_error(FaithTeams::API::V2::Error::NoSearchParameterProvided, "FaithTeams::API::V2::Error::NoSearchParameterProvided")
    end

    it "raises Error::Request with reason if success = false" do
      stub_contributions_find(parent_id: 183100, status: 200, description: "error")

      expect do
        gateway.contribution.find(id: 183100)
      end.to raise_error(FaithTeams::API::V2::Error::Request) do |error|
        expect(error.message).to match(/Request Unsuccessful: The contribution with parent_id .* could not be found./)
      end
    end
  end
end
