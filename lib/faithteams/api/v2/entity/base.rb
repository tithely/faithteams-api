# frozen_string_literal: true

module FaithTeams
  module API
    module V2
      # Wraps entities returned from the faithteams api.
      module Entity
        # Common entity functionality
        class Base
          # New instance of the class.
          def initialize(attributes:)
            @attributes = attributes
          end

          # @return [Hash]
          def to_h
            attributes
          end

          # @return [Boolean]
          def saved?
            !!read_attribute(:id)
          end

          private

          attr_reader :attributes

          def read_attribute(attribute)
            attributes[attribute.to_s]
          end
        end
      end
    end
  end
end
