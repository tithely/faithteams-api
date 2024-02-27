# frozen_string_literal: true

module FaithTeams
  module API
    module V2
      module Resource
        # Batch resource
        class Batch < Base
          # @param args [Hash] Keyword args
          # @return [Array<Entity::Batch>]
          def search(**args)
            found = connection.get(path: "/batches", params: args)["data"]
            return [] unless found.present?

            found.map { |b| Entity::Batch.new(attributes: b) }
          end

          # @param id [Integer]
          # @return [Entity::Batch, nil] containing all batch details
          # @raise [Error::Request]
          def find(id:)
            raise FaithTeams::API::V2::Error::NoSearchParameterProvided if id.nil?

            data = connection.get(path: "/batches/#{id}")["data"]
            return nil unless data

            Entity::Batch.new(attributes: data)
          rescue Error::Request => e
            return nil if e.response.code == 404
            raise
          end

          # Searches for a  batch by `dtm` and `title`
          # @note The batches endpoint does not actually filter by title so we do the filtering here.
          # @param batch [Entity::Batch]
          # @return [Entity::Batch, nil]
          def find_by_batch(batch:)
            found = search(sort: "dtm", sortDirection: "desc", dtm: batch.created_datetime)
            found.find { |b| !b.deleted? && b.title == batch.title }
          end

          # The response sends back the created batch in the `data` object.
          # @param entity [Entity::Batch]
          # @return [Entity::Batch]
          # @raise [Error::Request]
          def create(entity:)
            data = connection.post(path: "/batches", body: entity.to_h)["data"]

            Entity::Batch.new(attributes: data)
          rescue Error::Request => e
            raise Error::Request.new(response: e.response, message: "Request Unsuccessful: The batch #{entity.inspect} could not be created. FaithTeams API failure message: #{e.message}}") if e.response.status.success?
            raise
          end
        end
      end
    end
  end
end
