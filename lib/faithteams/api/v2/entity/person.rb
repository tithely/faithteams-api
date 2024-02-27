# frozen_string_literal: true

module FaithTeams
  module API
    module V2
      module Entity
        # Wraps an faithteams person object
        class Person < Base
          # @return [String, nil]
          def email
            read_attribute(:homeEmail).presence
          end

          # @return [String, nil]
          def first_name
            read_attribute(:firstName).presence
          end

          # @return [String, nil]
          def home_address_city
            read_attribute(:homeAddressCity).presence
          end

          # @return [String, nil]
          def home_address_country
            read_attribute(:homeAddressCountry).presence
          end

          # @return [String, nil]
          def home_address_state
            read_attribute(:homeAddressState).presence
          end

          # @return [String, nil]
          def home_address_street_line1
            read_attribute(:homeAddressStreetLine1).presence
          end

          # @return [String, nil]
          def home_address_street_line2
            read_attribute(:homeAddressStreetLine2).presence
          end

          # @return [String, nil]
          def home_address_zip
            read_attribute(:homeAddressZip).presence
          end

          # @return [String, nil]
          def home_phone_number
            read_attribute(:homePhoneNumber).presence
          end

          # @return [Integer, nil]
          def id
            read_attribute(:personId)
          end

          # @return [String, nil]
          def last_name
            read_attribute(:lastName).presence
          end

          # @return [Integer, nil]
          def org_id
            read_attribute(:orgId)
          end

          # @return [String, nil] "A" for active, "I" for inactive
          def status
            read_attribute(:status).presence
          end
        end
      end
    end
  end
end
