# frozen_string_literal: true

module FaithTeams
  module API
    module V2
      # A base class for all FaithTeam API versions
      class GatewayBase
        # @param connection [Integrations::API::Connection]
        def initialize(connection:)
          @connection = connection
        end

        # Required by integrations-gem
        # @return [Boolean]
        def valid_connection?
          connection.valid?
        end

        protected

        attr_reader :connection
      end
    end
  end
end
