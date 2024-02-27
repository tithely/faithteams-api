# frozen_string_literal: true

module FaithTeams
  module API
    module V2
      module Entity
        # Wraps a faithteams fund object.
        class Fund < Base
          # @return [String, nil] "N" for no, "Y" for yes
          def default
            read_attribute(:isDefault).presence
          end

          # @return [String, nil]
          def description
            read_attribute(:description).presence
          end

          # @return [Integer, nil]
          def fund_id
            read_attribute(:fundId)
          end

          # @return [String, nil]
          def name
            read_attribute(:name).presence
          end

          # @return [String, nil] "A" for active, "I" for inactive
          def online_status
            read_attribute(:onlineStatus).presence
          end

          # @return [Integer, nil]
          def org_id
            read_attribute(:orgId)
          end

          # @return [String, nil] "A" for active, "I" for inactive
          def status
            read_attribute(:status).presence
          end

          # @return [String, nil] "T" for true?, "Y" for yes?
          def tax_deductible
            read_attribute(:taxDeductible).presence
          end
        end
      end
    end
  end
end
