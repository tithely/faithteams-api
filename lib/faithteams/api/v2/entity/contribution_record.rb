# frozen_string_literal: true

module FaithTeams
  module API
    module V2
      module Entity
        # Wraps a faithteams contribution_record object.
        class ContributionRecord < Base
          # @return [Float, nil]
          def amount
            read_attribute(:amount)
          end

          # @return [Integer, nil]
          def batch_id
            read_attribute(:batchId)
          end

          # @return [String, nil]
          def check_number
            read_attribute(:checkNumber).presence
          end

          # @return [Integer, nil]
          def contribution_id
            read_attribute(:contributionId)
          end

          # @return [Integer, nil]
          def contribution_type_id
            read_attribute(:contributionTypeId)
          end

          # @return [String, nil]
          def contribution_type_name
            read_attribute(:contributionTypeName).presence
          end

          # @return [String, nil]
          def created_datetime
            read_attribute(:createdDtm).presence
          end

          # @return [Integer, nil]
          def created_user_id
            read_attribute(:createdUser)
          end

          # @return [Float, nil]
          def fee
            read_attribute(:fee)
          end

          # @return [Integer, nil]
          def fund_id
            read_attribute(:fundId)
          end

          # @return [String, nil]
          def fund_name
            read_attribute(:fundName).presence
          end

          # @return [String, nil]
          def give_datetime
            read_attribute(:giveDtm).presence
          end

          # @return [Float, nil]
          def net_amount
            read_attribute(:netAmount)
          end

          # @return [String, nil]
          def note
            read_attribute(:note).presence
          end

          # @return [Integer, nil]
          def org_id
            read_attribute(:orgId)
          end

          # @return [Integer, nil]
          def parent_id
            read_attribute(:parentId)
          end

          # @return [Integer, nil]
          def person_id
            read_attribute(:personId)
          end

          # @return [Integer, nil]
          def person_id_2
            read_attribute(:personId2)
          end

          # @return [String, nil] "H" for header, "D" for detail
          def record_type
            read_attribute(:recordType).presence
          end

          # @return [String, nil] "A" for active?
          def status
            read_attribute(:status).presence
          end

          # @return [Float, nil]
          def total_amount
            read_attribute(:totalAmount)
          end

          # @return [String, nil]
          def updated_datetime
            read_attribute(:updatedDtm).presence
          end

          # @return [Integer, nil]
          def updated_user_id
            read_attribute(:updatedUser)
          end

          # @return [Boolean]
          def header?
            record_type&.upcase == "H"
          end

          # @return [Boolean]
          def detail?
            record_type&.upcase == "D"
          end
        end
      end
    end
  end
end
