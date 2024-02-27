# frozen_string_literal: true

RSpec.configure do |c|
  c.include Support::V2::Stubs, :stubs
end

RSpec.describe FaithTeams::API::V2::Connection, :stubs, type: :model do
  let(:connection) { described_class.new(user_id: "test_id", password: "test_password") }

  describe "initialize" do
    it "requires non-blank user_id" do
      expect { described_class.new(user_id: "\r\n", password: "pass") }.to raise_error(ArgumentError, "A user_id is required")
    end

    it "requires non-blank user_id" do
      expect { described_class.new(user_id: "user", password: "\r\n") }.to raise_error(ArgumentError, "A password is required")
    end
  end

  describe "valid?" do
    before do
      allow_any_instance_of(described_class).to receive(:auth_token).and_return("81CteijcAJe8aEOW69sqALbcVur3yr4zi9feazgteiGQdVBTa9ZkAxybEzoB1tXelG")
    end

    it "is true if request to /contributiontypes is successful" do
      stub_contribution_types
      expect(connection.valid?).to be(true)
    end

    it "is false if connection is not valid" do
      stub_contribution_types(status: 401, body: any_json(status: 401))
      stub_authenticate(status: 401, body: any_json(status: 401))
      expect(connection.valid?).to be(false)
    end
  end

  describe "get" do
    before do
      allow_any_instance_of(described_class).to receive(:auth_token).and_return("81CteijcAJe8aEOW69sqALbcVur3yr4zi9feazgteiGQdVBTa9ZkAxybEzoB1tXelG")
    end

    context "/funds" do
      it "forwards path and params to underlying client with correct base url" do
        stub_funds
        path = "/funds"
        params = {}
        expect_any_instance_of(HTTP::Client).to receive(:get).with("https://api-v2.faithteams.com/funds", params: params).and_call_original
        connection.get(path: path, params: params)
      end
    end

    context "/people" do
      it "forwards path to underlying client with correct base url" do
        stub_people_search
        path = "/people"
        params = { "status": "A" }
        expect_any_instance_of(HTTP::Client).to receive(:get).with("https://app.faithteams.com/api/v2#{path}", params: params).and_call_original
        connection.get(path: path, params: params)
      end
    end

    context "/contributions" do
      it "forwards path to underlying client with correct base url" do
        path = "/contributions"
        params = { "filters": true }
        stub_contributions_list(params: params)
        expect_any_instance_of(HTTP::Client).to receive(:get).with("https://api-v2.faithteams.com#{path}", params: params).and_call_original
        connection.get(path: path, params: params)
      end
    end

    context "/batches" do
      it "forwards path to underlying client with correct base url" do
        path = "/batches"
        params = { "sort": "dtm" }
        stub_batches(params: params)
        expect_any_instance_of(HTTP::Client).to receive(:get).with("https://api-v2.faithteams.com#{path}", params: params).and_call_original
        connection.get(path: path, params: params)
      end
    end
  end

  describe "post" do
    before do
      allow_any_instance_of(described_class).to receive(:auth_token).and_return("81CteijcAJe8aEOW69sqALbcVur3yr4zi9feazgteiGQdVBTa9ZkAxybEzoB1tXelG")
    end

    context "/batches" do
      it "forwards path and body to underlying client with correct base url" do
        path = "/batches"
        body = { test: "value" }
        stub_batches_create
        expect_any_instance_of(HTTP::Client).to receive(:post).with("https://api-v2.faithteams.com#{path}", json: body).and_call_original
        connection.post(path: path, body: body)
      end
    end

    context "/contributions" do
      it "forwards path and body to underlying client with correct base url" do
        path = "/contributions"
        body = { test: "value" }
        stub_contributions_create
        expect_any_instance_of(HTTP::Client).to receive(:post).with("https://api-v2.faithteams.com#{path}", json: body).and_call_original
        connection.post(path: path, body: body)
      end
    end

    context "/people" do
      it "forwards path and body to underlying client with correct base url" do
        path = "/people"
        body = { test: "value" }
        stub_people_create
        expect_any_instance_of(HTTP::Client).to receive(:post).with("https://app.faithteams.com/api/v2#{path}", json: body).and_call_original
        connection.post(path: path, body: body)
      end
    end
  end

  describe "request" do
    context "when successful" do
      before do
        stub_authenticate
      end

      it "returns HTTP::Response" do
        stub_funds
        expect(connection.request(path: "/funds")).to be_a(HTTP::Response)
      end
    end

    context "when authentication fails on non-authenticate request" do
      before do
        stub_funds(status: 401, body: any_json(status: 401))
        stub_authenticate
      end

      it "will raise unathenticated error after multiple attempts" do
        expect(connection.user_resource).to receive(:authenticate).exactly(2).times.and_call_original

        expect { connection.request(path: "/funds") }.to raise_error(FaithTeams::API::V2::Error::Request, "Request unsuccessful (401 Unauthorized): Unauthorized")
      end
    end

    context "when authentication fails on authenticate request" do
      before do
        stub_authenticate(status: 401, body: any_json(status: 401))
      end

      it "will raise unathenticated error immediately" do
        expect(connection.user_resource).to receive(:authenticate).once.and_call_original

        expect { connection.request(path: "/funds") }.to raise_error(FaithTeams::API::V2::Error::Request, "Request unsuccessful (401 Unauthorized): Unauthorized")
      end
    end

    context "when not successful" do
      before do
        stub_funds(status: 511, body: "")
        stub_authenticate
      end

      it "raises Error::Request" do
        expect { connection.request(path: "/funds") }.to raise_error(FaithTeams::API::V2::Error::Request, "Request unsuccessful (511 Network Authentication Required)")
      end
    end
  end

  describe "request_and_parse" do
    context "method" do
      let(:http) { double }
      let(:response_status) { double(success?: true) }

      before do
        allow(connection).to receive(:http).and_return(http)
      end

      it "makes request based on method" do
        expect(http).to receive(:get).and_return(double(status: response_status, parse: { "success" => true }, content_length: 2, uri: "uri", headers: {}, code: 200, reason: "OK"))
        connection.request_and_parse(path: "/funds")

        expect(http).to receive(:post).and_return(double(status: response_status, parse: { "success" => true }, content_length: 2, uri: "uri", headers: {}, code: 200, reason: "OK"))
        connection.request_and_parse(method: :post, path: "/people")
      end
    end

    context "not successful" do
      it "raises error if response is not 200" do
        stub_authenticate
        stub_funds(status: 500, body: any_json(status: 500))
        expect { connection.request_and_parse(path: "/funds") }.to raise_error(FaithTeams::API::V2::Error::Request, "Request unsuccessful (500 Internal Server Error): Internal Server Error")
      end

      context "json parse error" do
        let(:http_token) { double }

        before do
          allow(connection).to receive(:http).and_return(http_token)
        end

        it "raises error if parsing JSON fails" do
          response = double(status: HTTP::Response::Status.new(200), body: "xyz", content_length: 3, uri: "uri", headers: {}, code: 200, reason: "reason")
          allow(response).to receive(:parse).and_raise(JSON::ParserError.new)
          expect(http_token).to receive(:get).and_return(response)
          expect { connection.request_and_parse(path: "/funds") }.to raise_error(FaithTeams::API::V2::Error::Request, "Failed to parse JSON")
        end
      end

      context "200 status but success = false" do
        it "raises Error::Request" do
          stub_authenticate
          stub_contributions_find(parent_id: 30, description: "error")
          expect { connection.request_and_parse(path: "/contributions/30") }.to raise_error(FaithTeams::API::V2::Error::Request, "Request unsuccessful: Error: Failed to convert value of type 'java.lang.String' to required type 'java.lang.Integer'; nested exception is java.lang.NumberFormatException: For input string: '429955534343434'")
        end
      end
    end
  end
end
