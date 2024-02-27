# frozen_string_literal: true

module FaithTeams
  module API
    module V2
      module Entity
        # Wraps an faithteams batch object
        class Batch < Base
          # @return [Integer, nil]
          def batch_id
            read_attribute(:batchId)
          end
          alias_method :id, :batch_id

          # @return [Array<FaithTeams::API::V2::Entity::Contributions>]
          def contributions
            records = read_attribute(:contributions)
            return [] unless records.present?

            records.group_by { |r| r["parentId"] }
              .values
              .map { FaithTeams::API::V2::Entity::Contribution.new(attributes: _1) }
          end

          # @return [String, nil]
          def created_datetime
            read_attribute(:dtm).presence
          end

          # @return [Integer, nil]
          def org_id
            read_attribute(:orgId)
          end

          # @return [String, nil] "O" for open, "C" for closed, "D" for deleted
          def status
            read_attribute(:status).presence
          end

          # @return [Boolean]
          def open?
            status == "O"
          end

          # @return [Boolean]
          def deleted?
            status == "D"
          end

          # @return [String, nil]
          def title
            read_attribute(:title).presence
          end

          # @return [String, nil]
          def updated_datetime
            read_attribute(:updatedDtm).presence
          end

          # @return [Integer, nil]
          def updated_user_id
            read_attribute(:updatedUser)
          end
        end
      end
    end
  end
end
