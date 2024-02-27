# frozen_string_literal: true

RSpec.describe FaithTeams::API::V2::Entity::ContributionType, type: :model do
  let(:attributes) do
    {
      "contributionTypeId" => 24,
      "name" => name,
      "status" => status
    }
  end
  let(:status) { "A" }
  let(:name) { "Tithely" }
  let(:contribution_type) { described_class.new(attributes: attributes) }

  describe "id" do
    it "is an Integer" do
      expect(contribution_type.id).to be_instance_of(Integer)
      expect(contribution_type.id).to eq(24)
    end
  end

  describe "name" do
    it "is a String" do
      expect(contribution_type.name).to be_instance_of(String)
      expect(contribution_type.name).to eq("Tithely")
    end
  end

  describe "status" do
    it "is a String" do
      expect(contribution_type.status).to be_instance_of(String)
      expect(contribution_type.status).to eq("A")
    end
  end

  example "attributes are nil/false if not present" do
    f = described_class.new(attributes: {})
    expect(f.id).to be_nil
    expect(f.name).to be_nil
    expect(f.status).to be_nil
  end

  example "string attributes are nil if empty string" do
    attributes = {
      "name" => "",
      "status" => ""
    }

    f = described_class.new(attributes: attributes)
    expect(f.name).to be_nil
    expect(f.status).to be_nil
  end

  describe "tithely?" do
    describe "case insensitivity" do
      context "when entity name is 'TiThElY'" do
        let(:name) { "TiThElY" }

        it "is true" do
          expect(contribution_type.tithely?).to be(true)
        end
      end

      context "when entity name is 'TITHELY'" do
        let(:name) { "TITHELY" }

        it "is true" do
          expect(contribution_type.tithely?).to be(true)
        end
      end

      context "when entity name is 'tithely'" do
        let(:name) { "tithely" }

        it "is true" do
          expect(contribution_type.tithely?).to be(true)
        end
      end

      context "when entity name is 'Tithely'" do
        let(:name) { "Tithely" }

        it "is true" do
          expect(contribution_type.tithely?).to be(true)
        end
      end
    end

    context "when entity name is not for tithely" do
      let(:name) { "Cash" }

      it "is false" do
        expect(contribution_type.tithely?).to be(false)
      end
    end
  end

  describe "active?" do
    context "when status is 'A'" do
      let(:status) { "A" }

      it "is true" do
        expect(contribution_type.active?).to be(true)
      end
    end

    context "when status is 'a'" do
      let(:status) { "a" }

      it "is true" do
        expect(contribution_type.active?).to be(true)
      end
    end

    context "when status is 'I'" do
      let(:status) { "I" }

      it "is false" do
        expect(contribution_type.active?).to be(false)
      end
    end
  end
end
