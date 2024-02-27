# frozen_string_literal: true

module FaithTeams
  module API
    module V2
      module Resource
        # Fund resource
        class Fund < Base
          # @param args [Hash] These are ignored as no filters are available for this endpoint
          # @return [Array<Entity::Fund>]
          # @raise [Error::Request]
          def search(**args)
            data = connection.get(path: "/funds")["data"]
            return [] unless data

            data.map { |r| Entity::Fund.new(attributes: r) }
          end
        end
      end
    end
  end
end
