# frozen_string_literal: true

require_relative "gateway_base"

module FaithTeams
  module API
    module V2
      # Central gateway for all API resources
      class Gateway < GatewayBase
        # @param connection [FaithTeams::API::V2::Connection]
        def initialize(connection:)
          @connection = connection
        end

        # @return [Resource::Batch]
        def batch
          @batch ||= Resource::Batch.new(connection: connection)
        end

        # @return [Resource::Fund]
        def fund
          @fund ||= Resource::Fund.new(connection: connection)
        end

        # @return [Resource::Person]
        def person
          @person ||= Resource::Person.new(connection: connection)
        end

        # @return [Resource::Contribution]
        def contribution
          @contribution ||= Resource::Contribution.new(connection: connection)
        end

        # @return [Resource::User]
        def user
          @user ||= Resource::User.new(connection: connection)
        end

        # @return [Resource::ContributionType]
        def contribution_type
          @contribution_type ||= Resource::ContributionType.new(connection: connection)
        end

        def valid_connection?
          connection.valid?
        end
      end
    end
  end
end
