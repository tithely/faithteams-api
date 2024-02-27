# frozen_string_literal: true

module FaithTeams
  module API
    module V2
      module Error
        # A request failed to complete successfully.
        class Request < StandardError
          attr_reader :response

          # Custom faithteams error about invalid API key
          UNAUTHORIZED_ERROR_MESSAGE = "Unauthorized"

          # Custom faithteams error when a resource is not found
          NOT_FOUND_ERROR_MESSAGE = "Not Found"

          # @param response [HTTP::Response]
          # @param message [String]
          def initialize(response:, message: "Request failed", skip_failure_message: false)
            @response = response
            message += ": #{failure_message}" unless failure_message.blank? || skip_failure_message
            super(message)
          end

          # @return [String]
          def failure_message
            @failure_message ||= response.parse(:json).dig("message") rescue ""
          rescue JSON::ParserError => e
            e.capture
            response.to_s
          end

          # @return [Boolean]
          def unauthorized?
            failure_message == UNAUTHORIZED_ERROR_MESSAGE
          end

          # @return [Boolean]
          def not_found?
            failure_message == NOT_FOUND_ERROR_MESSAGE
          end
        end
      end
    end
  end
end
