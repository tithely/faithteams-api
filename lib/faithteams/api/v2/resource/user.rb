# frozen_string_literal: true

module FaithTeams
  module API
    module V2
      module Resource
        # User resource
        class User < Base
          # @return [String] auth_token
          # @raise [Error::Request]
          def authenticate
            response = http.post("#{FaithTeams::API::V2::Connection::ENDPOINT_BASE_URLS["authenticate"]}/authenticate")

            # raise errors
            raise Error::Request.new(response: response, message: "Request unsuccessful (#{response.status})") unless response.status.success?

            # parse response
            begin
              response_body = response.parse(:json)
            rescue JSON::ParserError
              raise Error::Request.new(response: response, message: "Failed to parse JSON")
            end

            response_body.dig("data", "token")
          end

          private

          attr_reader :http

          # @return [HTTP::Client]
          def http
            user_credentials = Base64.strict_encode64("#{connection.user_id}:#{connection.password}")
            @http ||= HTTP.auth("Basic #{user_credentials}")
          end
        end
      end
    end
  end
end
