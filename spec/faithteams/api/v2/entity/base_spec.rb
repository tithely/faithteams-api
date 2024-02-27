# frozen_string_literal: true

RSpec.describe FaithTeams::API::V2::Entity::Base, type: :model do
  describe "to_h" do
    it "returns a hash of attributes" do
      expect(base.to_h).to eq({ "id" => 100001 })
    end
  end

  describe "saved?" do
    it "returns true if id is set" do
      expect(base.saved?).to be(true)
    end

    it "returns false if id is not set" do
      expect(base(attributes: { "id" => nil }).saved?).to be(false)
      expect(described_class.new(attributes: {}).saved?).to be(false)
    end
  end

  private

  def base(attributes: {})
    described_class.new(attributes: {
      "id" => 100001
    }.merge(attributes))
  end
end
