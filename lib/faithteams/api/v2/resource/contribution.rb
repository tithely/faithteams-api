# frozen_string_literal: true

module FaithTeams
  module API
    module V2
      module Resource
        # A transaction in faithteams
        class Contribution < Base
          # @param entity [Entity::Contribution]
          # @return [Entity::Contribution]
          # @raise [Error::Request]
          def create(entity:)
            data = connection.post(path: "/contributions", body: entity.to_h)["data"]

            Entity::Contribution.new(attributes: data)
          rescue Error::Request => e
            raise Error::Request.new(response: e.response, message: "Request Unsuccessful: The contribution #{entity.inspect} could not be created. FaithTeams API failure message: #{e.message}}") if e.response.status.success?
            raise
          end

          # @param id [Integer] The contributions `parent_id`
          # @return [Entity::Contribution, nil]
          # @raise [Error::Request]
          def find(id:)
            raise FaithTeams::API::V2::Error::NoSearchParameterProvided if id.nil?

            data = connection.get(path: "/contributions/#{id}")["data"]
            return nil unless data.present?

            Entity::Contribution.new(attributes: data)
          rescue Error::Request => e
            raise Error::Request.new(response: e.response, message: "Request Unsuccessful: The contribution with parent_id #{id} could not be found. FaithTeams API failure message: #{e.message}}") if e.response.status.success?
            raise
          end
        end
      end
    end
  end
end
