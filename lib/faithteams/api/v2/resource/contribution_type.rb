# frozen_string_literal: true

module FaithTeams
  module API
    module V2
      module Resource
        # The contribution type resource
        class ContributionType < Base
          # @param args [Hash] These are ignored as no filters are available for this endpoint
          # @return [Entity::ContributionType]
          def search(**args)
            data = connection.get(path: "/contributiontypes", params: {}).fetch("data")

            return nil unless data.present?

            data.map do |record|
              Entity::ContributionType.new(attributes: record)
            end
          end

          # @param id [Integer]
          # @return [Entity::ContributionType]
          def find(id:)
            return nil if id.blank?

            data = connection.get(path: "/contributiontypes/#{id}", params: {}).fetch("data")

            return nil unless data.present?

            Entity::ContributionType.new(attributes: data)
          rescue Error::Request => e
            e.response.code == 404 ? nil : raise
          end
        end
      end
    end
  end
end
