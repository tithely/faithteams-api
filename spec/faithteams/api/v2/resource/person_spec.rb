# frozen_string_literal: true

RSpec.configure do |c|
  c.include Support::V2::Stubs, :stubs
end

RSpec.describe FaithTeams::API::V2::Resource::Person, :stubs, type: :model do
  let(:connection) { FaithTeams::API::V2::Connection.new(user_id: "user_id", password: "password") }
  let(:gateway) { FaithTeams::API::V2::Gateway.new(connection: connection) }

  before do
    allow(connection).to receive(:auth_token).and_return("auth_token")
  end

  describe "create" do
    let(:person) { FaithTeams::API::V2::Entity::Person.new(attributes: { "firstName" => "Homer", "lastName" => "Simpson", "homeEmail" => "homer@springfield.com" }) }

    it "returns new entity with ID populated" do
      stub_people_create
      created = gateway.person.create(entity: person)
      expect(created).to be_instance_of(FaithTeams::API::V2::Entity::Person)
      expect(created.id).to eq(771091)
    end
  end

  describe "search" do
    it "returns an array of Entity::Person if they exist" do
      stub_people_search(params: { "firstName": "Homer" })
      expect(gateway.person.search(firstName: "Homer")).to all(be_instance_of(FaithTeams::API::V2::Entity::Person))
    end

    it "returns an empty array if no people match search criteria" do
      stub_people_search(params: { "firstName": "Homer" }, description: "empty")
      expect(gateway.person.search(firstName: "Homer")).to be_empty
    end
  end

  describe "find" do
    it "returns an Entity::Person instance" do
      stub_people_find(id: 769839)

      p = gateway.person.find(id: 769839)
      expect(p).to be_instance_of(FaithTeams::API::V2::Entity::Person)
      expect(p.id).to eq(769839)
      expect(p.email).to eq("david.orweller+ft-2@yourgiving.co")
      expect(p.first_name).to eq("David")
      expect(p.last_name).to eq("Orweller")
    end

    it "returns nil if person not found" do
      stub_people_find(id: 99999999, description: "not_found")

      expect(gateway.person.find(id: 99999999)).to be_nil
    end

    it "requires an id" do
      stub_people_find(id: 769839)

      expect { gateway.person.find }.to raise_error(ArgumentError, "missing keyword: :id")
      expect { gateway.person.find(id: nil) }.to raise_error(FaithTeams::API::V2::Error::NoSearchParameterProvided, "FaithTeams::API::V2::Error::NoSearchParameterProvided")
    end
  end
end
