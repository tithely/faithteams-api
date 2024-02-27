# frozen_string_literal: true

RSpec.describe FaithTeams::API::V2::Entity::Batch, type: :model do
  let(:attributes) do
    {
      "batchId" => 0,
      "orgId" => 1,
      "status" => "O",
      "title" => "Batch Title",
      "dtm" => "2023-03-27 08:20:05",
      "updatedDtm" => "2023-03-27 08:20:05",
      "updatedUser" => 12345,
      "contributions" => [
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
        },
        {
          "contributionId" => 4299563,
          "parentId" => 4299563,
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
          "createdDtm" => "2023-04-25 11:53:01",
          "createdUser" => 27985,
          "updatedDtm" => "2023-04-25 11:53:01",
          "updatedUser" => 27985,
          "giveDtm" => "2023-04-25 00:00:00"
        },
        {
          "contributionId" => 4299564,
          "parentId" => 4299563,
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
          "createdDtm" => "2023-04-25 11:53:01",
          "createdUser" => 27985,
          "updatedDtm" => "2023-04-25 11:53:01",
          "updatedUser" => 27985,
          "giveDtm" => "2023-04-25 00:00:00"
        }
      ]
    }
  end
  let(:batch) { described_class.new(attributes: attributes) }

  describe "created_datetime" do
    it "is a String" do
      expect(batch.created_datetime).to be_instance_of(String)
      expect(batch.created_datetime).to eq("2023-03-27 08:20:05")
    end
  end

  describe "contributions" do
    it "is an Array of FaithTeams::API::V2::Entity::Contribution" do
      expect(batch.contributions).to all(be_instance_of(FaithTeams::API::V2::Entity::Contribution))
      expect(batch.contributions.first.records).to all(be_instance_of(FaithTeams::API::V2::Entity::ContributionRecord))
    end

    it "groups contributions with the same parentId" do
      expect(batch.contributions.first.records.map(&:parent_id)).to all(eq(4299555))
      expect(batch.contributions.first.records.map(&:contribution_id)).to contain_exactly(4299555, 4299556)
    end
  end

  describe "batch_id" do
    it "is an Integer" do
      expect(batch.batch_id).to be_instance_of(Integer)
      expect(batch.batch_id).to eq(0)
    end
  end

  describe "id" do
    it "is alias of batch_id" do
      expect(batch.id).to eq(batch.batch_id)
    end
  end

  describe "org_id" do
    it "is an Integer" do
      expect(batch.org_id).to be_instance_of(Integer)
      expect(batch.org_id).to eq(1)
    end
  end

  describe "status" do
    it "is a String" do
      expect(batch.status).to be_instance_of(String)
      expect(batch.status).to eq("O")
    end
  end

  describe "open?" do
    it "is true if status is O" do
      b = described_class.new(attributes: { "status" => "O" })
      expect(b.open?).to be(true)
    end

    it "is false if status is not O" do
      b = described_class.new(attributes: { "status" => "C" })
      expect(b.open?).to be(false)
    end
  end

  describe "deleted?" do
    it "is true if status is D" do
      b = described_class.new(attributes: { "status" => "D" })
      expect(b.deleted?).to be(true)
    end

    it "is false if status is not D" do
      b = described_class.new(attributes: { "status" => "O" })
      expect(b.deleted?).to be(false)
    end
  end

  describe "title" do
    it "is a String" do
      expect(batch.title).to be_instance_of(String)
      expect(batch.title).to eq("Batch Title")
    end
  end

  describe "updated_datetime" do
    it "is a String" do
      expect(batch.updated_datetime).to be_instance_of(String)
      expect(batch.updated_datetime).to eq("2023-03-27 08:20:05")
    end
  end

  describe "updated_user_id" do
    it "is an Integer" do
      expect(batch.updated_user_id).to be_instance_of(Integer)
      expect(batch.updated_user_id).to eq(12345)
    end
  end

  example "attributes are nil if not present" do
    b = described_class.new(attributes: {})
    expect(b.batch_id).to be_nil
    expect(b.id).to be_nil
    expect(b.contributions).to be_empty
    expect(b.created_datetime).to be_nil
    expect(b.org_id).to be_nil
    expect(b.status).to be_nil
    expect(b.deleted?).to be(false)
    expect(b.title).to be_nil
    expect(b.updated_datetime).to be_nil
    expect(b.updated_user_id).to be_nil
  end

  example "string attributes are nil if empty string" do
    attributes = {
      "status" => "",
      "title" => "",
      "dtm" => "",
      "updatedDtm" => ""
    }

    b = described_class.new(attributes: attributes)
    expect(b.created_datetime).to be_nil
    expect(b.status).to be_nil
    expect(b.title).to be_nil
    expect(b.updated_datetime).to be_nil
  end
end
