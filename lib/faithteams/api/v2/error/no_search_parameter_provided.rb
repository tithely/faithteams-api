# frozen_string_literal: true

module FaithTeams
  module API
    module V2
      module Error
        # Thrown when a parameter is not given but should have been
        class NoSearchParameterProvided < StandardError; end
      end
    end
  end
end
