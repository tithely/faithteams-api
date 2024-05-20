# frozen_string_literal: true

require "uri"
require_relative "error"

module FaithTeams
  module API
    module V2
      # Faithteams API v2 connection
      class Connection
        # Specific base urls for different resources
        ENDPOINT_BASE_URLS = {
          "batches" => "https://api-v2.faithteams.com",
          "contributions" => "https://api-v2.faithteams.com",
          "contributiontypes" => "https://api-v2.faithteams.com",
          "funds" => "https://api-v2.faithteams.com",
          "people" => "https://app.faithteams.com/api/v2"
        }

        attr_reader :user_id, :password

        # @param user_id [String]
        # @param password [String]
        def initialize(user_id:, password:)
          raise ArgumentError.new("A user_id is required") if user_id.blank?
          raise ArgumentError.new("A password is required") if password.blank?

          @user_id = user_id
          @password = password
        end

        # Is the connection to FaithTeams valid?
        # @return [Boolean]
        def valid?
          get(path: "/contributiontypes")
          true
        rescue Error::Request
          false
        end

        # @param path [String]
        # @param params [Hash] Parameters to send with the request
        # @return [Hash]
        # @raise [Error::Request]
        def get(path:, params: {})
          request_and_parse(method: :get, path: path, params: params)
        end

        # @param path [String]
        # @param body [Hash, nil] Body to send
        # @return [Hash]
        # @raise [Error::Request]
        def post(path:, body: nil)
          request_and_parse(method: :post, path: path, body: body)
        end

        # Request an endpoint from faithteams, checking for errors
        # @param method [String] :get or :post
        # @param path [String] Path to the endpoint relative to ENDPOINT_BASE_URLS
        # @param params [Hash] Request parameters
        # @param body [Hash] Body to send
        # @return [HTTP::Response] Results of the request
        # @raise [Error::Request] Caller is responsible for capturing the error if needed
        def request(method: :get, path:, params: {}, body: {})
          url = "#{base_url(path: path)}#{path}"

          retries ||= 0
          response = nil
          loop do
            retries += 1

            case method.to_s
            when "post"
              response = http.post(url, json: body)
            else # get
              response = http.get(url, params: params)
            end
            break if response.status != 401 || retries >= 2
          end

          raise Error::Request.new(response: response, message: "Request unsuccessful (#{response.status})") unless response.status.success?

          response
        end

        # Request an endpoint from faithteams and parse the response
        # @param method [String] :get or :post
        # @param path [String] Path to the endpoint relative to ENDPOINT_BASE_URLS
        # @param params [Hash] Request parameters
        # @param body [Hash] Body to send
        # @return [Hash] Contents of the body
        # @raise [Error::Request] Caller is responsible for capturing the error if needed
        def request_and_parse(method: "get", path:, params: {}, body: {})
          response = request(method: method, path: path, params: params, body: body)
          begin
            response_body = response.parse(:json)
          rescue JSON::ParserError
            raise Error::Request.new(response: response, message: "Failed to parse JSON")
          end

          # raise errors when "status" = 200 but "success" = false
          raise Error::Request.new(response: response, message: "Request unsuccessful") unless response_body["success"] == true

          response_body
        end

        # @return [Resource::User]
        def user_resource
          @user_resource ||= Resource::User.new(connection: self)
        end

        private

        # @return [HTTP::Client]
        def http
          @http ||= HTTP.basic_auth(user: user_id, pass: password)
        end

        # @param path [String]
        # @return [String]
        def base_url(path:)
          ENDPOINT_BASE_URLS[path.split("/")[1]]
        end
      end
    end
  end
end
