# frozen_string_literal: true

require "active_support"

module Support
  module V2
    module Stubs
      def any_json(status:)
        read_fixture(name: "any.#{status}.json")
      end

      def batches_json(status: 200, method: nil, description: nil)
        name_json(resource: "batches", status: status, method: method, description: description)
      end

      def contributions_json(status: 200, method: nil, description: nil)
        name_json(resource: "contributions", status: status, method: method, description: description)
      end

      def contribution_types_json(status: 200, method: nil, description: nil)
        name_json(resource: "contribution_types", status: status, method: method, description: description)
      end

      def contribution_type_json(status: 200, method: nil, description: nil)
        name_json(resource: "contribution_type", status: status, method: method, description: description)
      end

      def stub_contribution_type(id:, status: 200, body: nil)
        stub_faithteams_request(
          path: "/contributiontypes/#{id}",
          body: body || contribution_type_json(status: status),
          status: status
        )
      end


      def endpoint_base_urls
        {
          "batches" => "https://api-v2.faithteams.com",
          "contributions" => "https://api-v2.faithteams.com",
          "contributiontypes" => "https://api-v2.faithteams.com",
          "funds" => "https://api-v2.faithteams.com",
          "people" => "https://app.faithteams.com/api/v2"
        }
      end

      def funds_json(status: 200, method: nil, description: nil)
        name_json(resource: "funds", status: status, method: method, description: description)
      end

      def name_json(resource:, status:, method:, description:)
        method_text = method ? "#{method}." : ""
        desc_text = description ? ".#{description}" : ""
        read_fixture(name: "#{resource}.#{method_text}#{status}#{desc_text}.json")
      end

      def people_json(status: 200, method: nil, description: nil)
        name_json(resource: "people", status: status, method: method, description: description)
      end

      def stub_batches_create(status: 201, body: nil, method: "create", description: nil)
        stub_faithteams_request(
          method: :post,
          path: "/batches",
          body: body || batches_json(status: status, method: method, description: description),
          status: status
        )
      end

      def stub_batches_find(id:, status: 200, body: nil, method: "find", description: nil)
        stub_faithteams_request(
          path: "/batches/#{id}",
          body: body || batches_json(status: status, method: method, description: description),
          status: status
        )
      end

      def stub_batches(status: 200, params: {}, body: nil, method: "search", description: nil)
        stub_faithteams_request(
          path: "/batches",
          params: params,
          body: body || batches_json(status: status, method: method, description: description),
          status: status
        )
      end

      def stub_contributions_create(status: 201, body: nil, method: "create", description: nil)
        stub_faithteams_request(
          method: :post,
          path: "/contributions",
          body: body || contributions_json(status: status, method: method, description: description),
          status: status
        )
      end

      def stub_contributions_find(parent_id:, status: 200, body: nil, method: "find", description: nil)
        stub_faithteams_request(
          path: "/contributions/#{parent_id}",
          body: body || contributions_json(status: status, method: method, description: description),
          status: status
        )
      end

      def stub_contributions_list(status: 200, params: {}, body: nil, method: "list", description: nil)
        stub_faithteams_request(
          path: "/contributions",
          params: params,
          body: body || contributions_json(status: status, method: method, description: description),
          status: status
        )
      end

      def stub_contribution_types(status: 200, body: nil, description: nil)
        stub_faithteams_request(
          path: "/contributiontypes",
          body: body || contribution_types_json(status: status, description: description),
          status: status
        )
      end

      def stub_funds(status: 200, body: nil, method: "list", description: nil)
        stub_faithteams_request(
          path: "/funds",
          body: body || funds_json(status: status, method: method, description: description),
          status: status
        )
      end

      def stub_people_create(status: 201, body: nil, method: "create", description: nil)
        stub_faithteams_request(
          method: :post,
          path: "/people",
          body: body || people_json(status: status, method: method, description: description),
          status: status
        )
      end

      def stub_people_find(id:, status: 200, body: nil, method: "find", description: nil)
        stub_faithteams_request(
          path: "/people/#{id}",
          body: body || people_json(status: status, method: method, description: description),
          status: status
        )
      end

      def stub_people_search(status: 200, params: {}, body: nil, method: "search", description: nil)
        stub_faithteams_request(
          path: "/people",
          params: { "status": "A" }.merge(params),
          body: body || people_json(status: status, method: method, description: description),
          status: status
        )
      end

      private

      def stub_faithteams_request(path:, params: nil, body: "", status: 200, method: :get, headers: {})
        url = "#{base_url(path: path)}#{path}"
        stub_request(method, url)
          .with(query: params)
          .to_return(status: status, body: body, headers: { "Content-Type"=>"application/json;charset=UTF-8" }.merge(headers))
      end

      def base_url(path:)
        endpoint_base_urls[path.split("/")[1]]
      end

      def read_fixture(name:)
        File.read(File.join("spec", "fixtures", "files", "faithteams", "v2", name))
      end
    end
  end
end
