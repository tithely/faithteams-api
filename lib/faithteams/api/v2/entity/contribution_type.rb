# frozen_string_literal: true

module FaithTeams
  module API
    module V2
      module Entity
        # Wraps a faithteams contribution type object.
        class ContributionType < Base
          # @return [Integer, nil]
          def id
            read_attribute(:contributionTypeId)
          end

          # @return [String, nil]
          def name
            read_attribute(:name).presence
          end

          # @return [String, nil] "A" for active, "I" for inactive
          def status
            read_attribute(:status).presence
          end

          # @return [Boolean]
          def tithely?
            (name || "").strip.downcase == "tithely"
          end

          # @return [Boolean]
          def active?
            (status || "I").strip.upcase == "A"
          end
        end
      end
    end
  end
end
