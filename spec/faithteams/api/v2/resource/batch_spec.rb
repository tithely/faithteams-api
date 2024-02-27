# frozen_string_literal: true

RSpec.configure do |c|
  c.include Support::V2::Stubs, :stubs
end

RSpec.describe FaithTeams::API::V2::Resource::Batch, :stubs, type: :model do
  let(:connection) { FaithTeams::API::V2::Connection.new(user_id: "user_id", password: "password") }
  let(:gateway) { FaithTeams::API::V2::Gateway.new(connection: connection) }
  let(:batch) do
    FaithTeams::API::V2::Entity::Batch.new(attributes:
      {
        "title" => "2023-08-23 Central Campus Tithely Card",
        "dtm" => "2023-08-23 00:00:00",
        "status" => "O"
      }
    )
  end

  before do
    allow_any_instance_of(FaithTeams::API::V2::Connection).to receive(:auth_token).and_return("auth_token")
  end

  describe "search" do
    it "already exists for contribution dates" do
      stub_batches
      found = gateway.batch.search
      expect(found).to all(be_instance_of(FaithTeams::API::V2::Entity::Batch))
      expect(found.size).to eq(18)
    end

    it "returns empty string if not found" do
      stub_batches(description: "empty")
      found = gateway.batch.search()
      expect(found).to be_empty
    end
  end

  describe "find" do
    it "returns existing batch when given id" do
      stub_batches_find(id: 183100, description: "without_contributions")
      batch = gateway.batch.find(id: 183100)
      expect(batch).to be_instance_of(FaithTeams::API::V2::Entity::Batch)
      expect(batch.batch_id).to eq(183100)
    end

    it "returns contributions with existing batch if present" do
      stub_batches_find(id: 183100, description: "with_contributions")
      batch = gateway.batch.find(id: 183100)
      expect(batch).to be_instance_of(FaithTeams::API::V2::Entity::Batch)
      expect(batch.batch_id).to eq(183100)
      expect(batch.contributions).to all(be_instance_of(FaithTeams::API::V2::Entity::Contribution))
    end

    it "returns nil if batch cannot be found" do
      stub_batches_find(id: 183100, status: 404)
      batch = gateway.batch.find(id: 183100)
      expect(batch).to be_nil
    end

    it "requires an id" do
      stub_batches_find(id: 183100, description: "with_contributions")
      expect { gateway.batch.find }.to raise_error(ArgumentError, "missing keyword: :id")
      expect { gateway.batch.find(id: nil) }.to raise_error(FaithTeams::API::V2::Error::NoSearchParameterProvided, "FaithTeams::API::V2::Error::NoSearchParameterProvided")
    end
  end

  describe "find_by_batch" do
    it "searches for batch by title and dtm" do
      stub_batches(params: { sort: "dtm", sortDirection: "desc", dtm: batch.created_datetime }, method: "find_by_batch")
      found = gateway.batch.find_by_batch(batch: batch)
      expect(found).to be_instance_of(FaithTeams::API::V2::Entity::Batch)
      expect(found.created_datetime).to eq(batch.created_datetime)
      expect(found.title).to eq(batch.title)
    end

    it "returns first batch if multiple found" do
      stub_batches(params: { sort: "dtm", sortDirection: "desc", dtm: batch.created_datetime }, method: "search")
      found = gateway.batch.find_by_batch(batch: batch)
      expect(found).to be_instance_of(FaithTeams::API::V2::Entity::Batch)
      expect(found.created_datetime).to eq(batch.created_datetime)
      expect(found.title).to eq(batch.title)
    end

    it "ignores deleted batches" do
      stub_batches(params: { sort: "dtm", sortDirection: "desc", dtm: batch.created_datetime }, method: "search", description: "duplicates_with_deleted")
      found = gateway.batch.find_by_batch(batch: batch)
      expect(found).to be_instance_of(FaithTeams::API::V2::Entity::Batch)
      expect(found.created_datetime).to eq(batch.created_datetime)
      expect(found.title).to eq(batch.title)
      expect(found.batch_id).to eq(200761)
    end

    it "returns nil if batch cannot be found" do
      stub_batches(params: { sort: "dtm", sortDirection: "desc", dtm: batch.created_datetime }, description: "empty")
      expect(gateway.batch.find_by_batch(batch: batch)).to be_nil
    end
  end

  describe "create" do
    let(:batch) { FaithTeams::API::V2::Entity::Batch.new(attributes: {
      "title" => "Tithely 2023-04-23 Bank",
      "dtm" => "2023-04-23 00:00:00",
      "status" => "O"
    }) }

    it "returns new entity with ID populated" do
      stub_batches_create

      created = gateway.batch.create(entity: batch)
      expect(created.batch_id).to eq(183055)
    end

    it "raises Error::Request with reason if batch could not be created" do
      stub_batches_create(status: 200, description: "error")

      expect do
        gateway.batch.create(entity: batch)
      end.to raise_error(FaithTeams::API::V2::Error::Request) do |error|
        expect(error.message).to match(/Request Unsuccessful: The batch #<.*> could not be created./)
      end
    end
  end
end
