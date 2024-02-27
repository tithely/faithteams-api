# frozen_string_literal: true

RSpec.describe FaithTeams::API::V2::Entity::Fund, type: :model do
  let(:attributes) do
    {
      "fundId" => 4408,
      "orgId" => 7,
      "name" => "Missions",
      "description" => "cute description here",
      "status" => "A",
      "onlineStatus" => "A",
      "taxDeductible" => "T",
      "isDefault" => "N"
    }
  end
  let(:fund) { described_class.new(attributes: attributes) }

  describe "default" do
    it "is a String" do
      expect(fund.default).to be_instance_of(String)
      expect(fund.default).to eq("N")
    end
  end

  describe "description" do
    it "is a String" do
      expect(fund.description).to be_instance_of(String)
      expect(fund.description).to eq("cute description here")
    end
  end

  describe "fund_id" do
    it "is an Integer" do
      expect(fund.fund_id).to be_instance_of(Integer)
      expect(fund.fund_id).to eq(4408)
    end
  end

  describe "name" do
    it "is a String" do
      expect(fund.name).to be_instance_of(String)
      expect(fund.name).to eq("Missions")
    end
  end

  describe "online_status" do
    it "is a String" do
      expect(fund.online_status).to be_instance_of(String)
      expect(fund.online_status).to eq("A")
    end
  end

  describe "org_id" do
    it "is an Integer" do
      expect(fund.org_id).to be_instance_of(Integer)
      expect(fund.org_id).to eq(7)
    end
  end

  describe "status" do
    it "is a String" do
      expect(fund.status).to be_instance_of(String)
      expect(fund.status).to eq("A")
    end
  end

  describe "tax_deductible" do
    it "is a String" do
      expect(fund.tax_deductible).to be_instance_of(String)
      expect(fund.tax_deductible).to eq("T")
    end
  end

  example "attributes are nil/false if not present" do
    f = described_class.new(attributes: {})
    expect(f.default).to be_nil
    expect(f.description).to be_nil
    expect(f.fund_id).to be_nil
    expect(f.name).to be_nil
    expect(f.online_status).to be_nil
    expect(f.org_id).to be_nil
    expect(f.status).to be_nil
    expect(f.tax_deductible).to be_nil
  end

  example "string attributes are nil if empty string" do
    attributes = {
      "name" => "",
      "description" => "",
      "status" => "",
      "onlineStatus" => "",
      "taxDeductible" => "",
      "isDefault" => ""
    }

    f = described_class.new(attributes: attributes)
    expect(f.default).to be_nil
    expect(f.description).to be_nil
    expect(f.name).to be_nil
    expect(f.online_status).to be_nil
    expect(f.status).to be_nil
    expect(f.tax_deductible).to be_nil
  end
end
