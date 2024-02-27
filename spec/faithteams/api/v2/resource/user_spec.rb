# frozen_string_literal: true

RSpec.configure do |c|
  c.include Support::V2::Stubs, :stubs
end

RSpec.describe FaithTeams::API::V2::Resource::User, :stubs, type: :model do
  let(:connection) { FaithTeams::API::V2::Connection.new(user_id: "user_id", password: "password") }
  let(:gateway) { FaithTeams::API::V2::Gateway.new(connection: connection) }

  before do
    allow_any_instance_of(FaithTeams::API::V2::Connection).to receive(:auth_token).and_return("auth_token")
  end

  describe "authenticate" do
    it "returns auth_token" do
      stub_authenticate
      expect(gateway.user.authenticate).to eq("81CteijcAJe8aEOW69sqALbcVur3yr4zi9feazgteiGQdVBTa9ZkAxybEzoB1tXelG")
    end

    context "error" do
      it "raises errors" do
        stub_authenticate(status: 401, body: any_json(status: 401))
        expect { gateway.user.authenticate }.to raise_error(FaithTeams::API::V2::Error::Request)
      end
    end
  end
end
