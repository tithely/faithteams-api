# frozen_string_literal: true

RSpec.describe FaithTeams::API::V2::Entity::Person, type: :model do
  let(:attributes) do
    {
      "firstName" => "Michael",
      "homeAddressCity" => "Allegan",
      "homeAddressCountry" => "US",
      "homeAddressState" => "MI",
      "homeAddressStreetLine1" => "2019 30th St.",
      "homeAddressStreetLine2" => "Apt 3",
      "homeAddressZip" => "49010",
      "homeEmail" => "mj@ballers.com",
      "homePhoneNumber" => "6667778888",
      "lastName" => "Jordan",
      "orgId" => 1,
      "personId" => 95000,
      "status" => "I"
    }
  end
  let(:person) { described_class.new(attributes: attributes) }

  describe "email" do
    it "is a String" do
      expect(person.email).to be_instance_of(String)
      expect(person.email).to eq("mj@ballers.com")
    end
  end

  describe "first_name" do
    it "is a String" do
      expect(person.first_name).to be_instance_of(String)
      expect(person.first_name).to eq("Michael")
    end
  end

  describe "home_address_city" do
    it "is a String" do
      expect(person.home_address_city).to be_instance_of(String)
      expect(person.home_address_city).to eq("Allegan")
    end
  end

  describe "home_address_country" do
    it "is a String" do
      expect(person.home_address_country).to be_instance_of(String)
      expect(person.home_address_country).to eq("US")
    end
  end

  describe "home_address_state" do
    it "is a String" do
      expect(person.home_address_state).to be_instance_of(String)
      expect(person.home_address_state).to eq("MI")
    end
  end

  describe "home_address_street_line1" do
    it "is a String" do
      expect(person.home_address_street_line1).to be_instance_of(String)
      expect(person.home_address_street_line1).to eq("2019 30th St.")
    end
  end

  describe "home_address_street_line2" do
    it "is a String" do
      expect(person.home_address_street_line2).to be_instance_of(String)
      expect(person.home_address_street_line2).to eq("Apt 3")
    end
  end

  describe "home_address_zip" do
    it "is a String" do
      expect(person.home_address_zip).to be_instance_of(String)
      expect(person.home_address_zip).to eq("49010")
    end
  end

  describe "home_phone_number" do
    it "is a String" do
      expect(person.home_phone_number).to be_instance_of(String)
      expect(person.home_phone_number).to eq("6667778888")
    end
  end

  describe "id" do
    it "is an Integer" do
      expect(person.id).to be_instance_of(Integer)
      expect(person.id).to eq(95000)
    end
  end

  describe "last_name" do
    it "is a String" do
      expect(person.last_name).to be_instance_of(String)
      expect(person.last_name).to eq("Jordan")
    end
  end

  describe "org_id" do
    it "is an Integer" do
      expect(person.org_id).to be_instance_of(Integer)
      expect(person.org_id).to eq(1)
    end
  end

  describe "status" do
    it "is a String" do
      expect(person.status).to be_instance_of(String)
      expect(person.status).to eq("I")
    end
  end

  example "attributes are nil / empty if not present" do
    p = described_class.new(attributes: {})
    expect(p.email).to be_nil
    expect(p.first_name).to be_nil
    expect(p.home_address_city).to be_nil
    expect(p.home_address_country).to be_nil
    expect(p.home_address_state).to be_nil
    expect(p.home_address_street_line1).to be_nil
    expect(p.home_address_street_line2).to be_nil
    expect(p.home_address_zip).to be_nil
    expect(p.home_phone_number).to be_nil
    expect(p.id).to be_nil
    expect(p.last_name).to be_nil
    expect(p.org_id).to be_nil
    expect(p.status).to be_nil
  end

  example "string attributes are nil if empty string" do
    attributes = {
      "firstName" => "",
      "homeAddressCity" => "",
      "homeAddressCountry" => "",
      "homeAddressState" => "",
      "homeAddressStreetLine1" => "",
      "homeAddressStreetLine2" => "",
      "homeAddressZip" => "",
      "homeEmail" => "",
      "homePhoneNumber" => "",
      "lastName" => "",
      "status" => "",
    }

    p = described_class.new(attributes: attributes)
    expect(p.email).to be_nil
    expect(p.first_name).to be_nil
    expect(p.home_address_city).to be_nil
    expect(p.home_address_country).to be_nil
    expect(p.home_address_state).to be_nil
    expect(p.home_address_street_line1).to be_nil
    expect(p.home_address_street_line2).to be_nil
    expect(p.home_address_zip).to be_nil
    expect(p.home_phone_number).to be_nil
    expect(p.last_name).to be_nil
    expect(p.status).to be_nil
  end
end
