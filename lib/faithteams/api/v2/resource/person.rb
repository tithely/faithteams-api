# frozen_string_literal: true

module FaithTeams
  module API
    module V2
      module Resource
        # Person resource
        class Person < Base
          # By default, it only looks for active people. To search for inactive people, pass in status: "I".
          # @param args [Hash] Search parameters consisting of symbole key => value pairs
          # @return [Array<Entity::Person>]
          # @raise [Error::Request]
          def search(**args)
            params = { status: "A" }.merge(args)

            data = connection.get(path: "/people", params: params.stringify_keys)["data"]
            return [] unless data.present?

            data.map { |r| Entity::Person.new(attributes: r) }
          end

          # @param id [Integer]
          # @return [Entity::Person, nil]
          # @raise [Error::Request]
          def find(id:)
            raise FaithTeams::API::V2::Error::NoSearchParameterProvided if id.nil?

            data = connection.get(path: "/people/#{id}")["data"]
            return nil unless data

            Entity::Person.new(attributes: data)
          rescue Error::Request => e
            return nil if e.not_found?
            raise
          end

          # @param entity [Entity::Person]
          # @return [Entity::Person]
          # @raise [Error::Request]
          def create(entity:)
            data = connection.post(path: "/people", body: entity.to_h)["data"]
            Entity::Person.new(attributes: data)
          end
        end
      end
    end
  end
end
