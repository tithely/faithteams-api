# frozen_string_literal: true

RSpec.describe FaithTeams::API::V2::Entity::Contribution, type: :model do
  let(:attributes) {
    [
      {
        "contributionId" => 4299555,
        "parentId" => 4299555,
        "recordType" => "H",
        "personId" => 0,
        "personId2" => -98,
        "batchId" => 183273,
        "sortIndex" => 0,
        "amount" => 5.00,
        "fee" => 0.00,
        "netAmount" => 5.00,
        "contributionTypeId" => 8004,
        "fundId" => 0,
        "checkNumber" => "",
        "status" => "A",
        "note" => "a brief note",
        "createdDtm" => "2023-04-25 15:51:57",
        "createdUser" => 27985,
        "updatedDtm" => "2023-04-25 15:51:57",
        "updatedUser" => 27985,
        "giveDtm" => "2023-04-25 00:00:00"
      },
      {
        "contributionId" => 4299556,
        "parentId" => 4299555,
        "recordType" => "D",
        "personId" => 0,
        "personId2" => -98,
        "batchId" => 183273,
        "sortIndex" => 1,
        "amount" => 5.00,
        "fee" => 0.00,
        "netAmount" => 5.00,
        "contributionTypeId" => 8004,
        "fundId" => 7894,
        "status" => "A",
        "note" => "a brief note",
        "createdDtm" => "2023-04-25 15:51:57",
        "createdUser" => 27985,
        "updatedDtm" => "2023-04-25 15:51:57",
        "updatedUser" => 27985,
        "giveDtm" => "2023-04-25 00:00:00"
      }
    ]
  }
  let!(:contribution) { described_class.new(attributes: attributes) }

  describe "records" do
    it "is a FaithTeams::API::V2::Entity::ContributionRecord" do
      expect(contribution).to be_instance_of(FaithTeams::API::V2::Entity::Contribution)
      expect(contribution.records).to all(be_instance_of(FaithTeams::API::V2::Entity::ContributionRecord))
    end
  end

  example "attributes are nil / default if not present" do
    c = described_class.new(attributes: [])
    expect(c.records).to be_empty
  end
end
