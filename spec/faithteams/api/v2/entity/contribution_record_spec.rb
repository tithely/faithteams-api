# frozen_string_literal: true

RSpec.describe FaithTeams::API::V2::Entity::ContributionRecord, type: :model do
  let(:attributes) do
    {
      "contributionId" => 591088,
      "parentId" => 591087,
      "recordType" => "H",
      "contributionTypeId" => 24,
      "contributionTypeName" => "Tithely",
      "personId" => 9,
      "personId2" => 99,
      "batchId" => 20000,
      "totalAmount" => 5.00,
      "fundId" => 1000,
      "fundName" => "General Fund",
      "checkNumber" => "1234",
      "note" => "text-to-give",
      "amount" => 5.00,
      "fee" => 0.50,
      "netAmount" => 4.50,
      "status" => "A",
      "createdDtm" => "2019-11-13 03:14:42",
      "createdUser" => 12345,
      "updatedDtm" => "2019-11-13 03:14:42",
      "updatedUser" => 12345,
      "giveDtm" => "2019-11-11 03:14:42",
      "orgId" => 0
    }
  end
  let(:contribution_record) { described_class.new(attributes: attributes) }

  describe "amount" do
    it "is a Float" do
      expect(contribution_record.amount).to be_instance_of(Float)
      expect(contribution_record.amount).to eq(5.00)
    end
  end

  describe "batch_id" do
    it "is an Integer" do
      expect(contribution_record.batch_id).to be_instance_of(Integer)
      expect(contribution_record.batch_id).to eq(20000)
    end
  end

  describe "check_number" do
    it "is a String" do
      expect(contribution_record.check_number).to be_instance_of(String)
      expect(contribution_record.check_number).to eq("1234")
    end
  end

  describe "contribution_id" do
    it "is an Integer" do
      expect(contribution_record.contribution_id).to be_instance_of(Integer)
      expect(contribution_record.contribution_id).to eq(591088)
    end
  end

  describe "contribution_type_id" do
    it "is an Integer" do
      expect(contribution_record.contribution_type_id).to be_instance_of(Integer)
      expect(contribution_record.contribution_type_id).to eq(24)
    end
  end

  describe "contribution_type_name" do
    it "is a String" do
      expect(contribution_record.contribution_type_name).to be_instance_of(String)
      expect(contribution_record.contribution_type_name).to eq("Tithely")
    end
  end

  describe "created_datetime" do
    it "is a String" do
      expect(contribution_record.created_datetime).to be_instance_of(String)
      expect(contribution_record.created_datetime).to eq("2019-11-13 03:14:42")
    end
  end

  describe "created_user_id" do
    it "is an Integer" do
      expect(contribution_record.created_user_id).to be_instance_of(Integer)
      expect(contribution_record.created_user_id).to eq(12345)
    end
  end

  describe "fee" do
    it "is a Float" do
      expect(contribution_record.fee).to be_instance_of(Float)
      expect(contribution_record.fee).to eq(0.50)
    end
  end

  describe "fund_id" do
    it "is an Integer" do
      expect(contribution_record.fund_id).to be_instance_of(Integer)
      expect(contribution_record.fund_id).to eq(1000)
    end
  end

  describe "fund_name" do
    it "is a String" do
      expect(contribution_record.fund_name).to be_instance_of(String)
      expect(contribution_record.fund_name).to eq("General Fund")
    end
  end

  describe "give_datetime" do
    it "is a String" do
      expect(contribution_record.give_datetime).to be_instance_of(String)
      expect(contribution_record.give_datetime).to eq("2019-11-11 03:14:42")
    end
  end

  describe "net_amount" do
    it "is a Float" do
      expect(contribution_record.net_amount).to be_instance_of(Float)
      expect(contribution_record.net_amount).to eq(4.50)
    end
  end

  describe "note" do
    it "is a String" do
      expect(contribution_record.note).to be_instance_of(String)
      expect(contribution_record.note).to eq("text-to-give")
    end
  end

  describe "org_id" do
    it "is an Integer" do
      expect(contribution_record.org_id).to be_instance_of(Integer)
      expect(contribution_record.org_id).to eq(0)
    end
  end

  describe "parent_id" do
    it "is an Integer" do
      expect(contribution_record.parent_id).to be_instance_of(Integer)
      expect(contribution_record.parent_id).to eq(591087)
    end
  end

  describe "person_id" do
    it "is an Integer" do
      expect(contribution_record.person_id).to be_instance_of(Integer)
      expect(contribution_record.person_id).to eq(9)
    end
  end

  describe "person_id_2" do
    it "is an Integer" do
      expect(contribution_record.person_id_2).to be_instance_of(Integer)
      expect(contribution_record.person_id_2).to eq(99)
    end
  end

  describe "record_type" do
    it "is a String" do
      expect(contribution_record.record_type).to be_instance_of(String)
      expect(contribution_record.record_type).to eq("H")
    end
  end

  describe "status" do
    it "is a String" do
      expect(contribution_record.status).to be_instance_of(String)
      expect(contribution_record.status).to eq("A")
    end
  end

  describe "total_amount" do
    it "is an Float" do
      expect(contribution_record.total_amount).to be_instance_of(Float)
      expect(contribution_record.total_amount).to eq(5.00)
    end
  end

  describe "updated_datetime" do
    it "is a String" do
      expect(contribution_record.updated_datetime).to be_instance_of(String)
      expect(contribution_record.updated_datetime).to eq("2019-11-13 03:14:42")
    end
  end

  describe "updated_user_id" do
    it "is an Integer" do
      expect(contribution_record.updated_user_id).to be_instance_of(Integer)
      expect(contribution_record.updated_user_id).to eq(12345)
    end
  end

  example "attributes are nil / default if not present" do
    c = described_class.new(attributes: {})
    expect(c.amount).to be_nil
    expect(c.batch_id).to be_nil
    expect(c.check_number).to be_nil
    expect(c.contribution_id).to be_nil
    expect(c.contribution_type_id).to be_nil
    expect(c.contribution_type_name).to be_nil
    expect(c.created_datetime).to be_nil
    expect(c.created_user_id).to be_nil
    expect(c.fee).to be_nil
    expect(c.fund_id).to be_nil
    expect(c.fund_name).to be_nil
    expect(c.give_datetime).to be_nil
    expect(c.net_amount).to be_nil
    expect(c.note).to be_nil
    expect(c.org_id).to be_nil
    expect(c.parent_id).to be_nil
    expect(c.person_id).to be_nil
    expect(c.person_id_2).to be_nil
    expect(c.record_type).to be_nil
    expect(c.status).to be_nil
    expect(c.total_amount).to be_nil
    expect(c.updated_datetime).to be_nil
    expect(c.updated_user_id).to be_nil
  end

  example "string attributes are nil if empty string" do
    attributes = {
      "recordType" => "",
      "contributionTypeName" => "",
      "note" => "",
      "status" => "",
      "createdDtm" => "",
      "updatedDtm" => "",
      "giveDtm" => "",
      "fundName" => "",
      "checkNumber" => ""
    }

    c = described_class.new(attributes: attributes)
    expect(c.check_number).to be_nil
    expect(c.contribution_type_name).to be_nil
    expect(c.created_datetime).to be_nil
    expect(c.fund_name).to be_nil
    expect(c.give_datetime).to be_nil
    expect(c.note).to be_nil
    expect(c.record_type).to be_nil
    expect(c.status).to be_nil
    expect(c.updated_datetime).to be_nil
  end
end
