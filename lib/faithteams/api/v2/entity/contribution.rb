# frozen_string_literal: true

module FaithTeams
  module API
    module V2
      module Entity
        # Wraps a faithteams contribution object.
        class Contribution < Base
          # @return [Array<ContributionRecord>] the contribution records
          def records
            attributes.map do |record|
              FaithTeams::API::V2::Entity::ContributionRecord.new(attributes: record)
            end
          end
        end
      end
    end
  end
end
