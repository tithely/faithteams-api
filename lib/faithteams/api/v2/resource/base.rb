# frozen_string_literal: true

require "active_support/core_ext/hash/keys"
require "active_support/core_ext/object/blank"

module FaithTeams
  module API
    module V2
      module Resource
        # Common Resource functionality
        # Additional methods can be added but the following methods should not be missing
        class Base < GatewayBase
          # @param id [Integer] The contribution payment_id.
          # @return [Entity::Base, nil]
          def find(id:)
            raise NotImplementedError
          end

          # @param args [Hash] Key values to search with
          # @return [Array<Entity::Base>]
          def search(**args)
            raise NotImplementedError
          end

          # @param entity [Entity::Base]
          # @return [Entity::Base, false]
          def create(entity:)
            raise NotImplementedError
          end

          # @param entity [Entity::Base]
          # @return [Entity::Base, false]
          def update(entity:)
            raise NotImplementedError
          end

          # @param id [#to_s] ID of the entity to delete
          # @return [Boolean]
          def delete(id:)
            raise NotImplementedError
          end
        end
      end
    end
  end
end
