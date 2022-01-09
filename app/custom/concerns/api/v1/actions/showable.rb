module Api
  module V1
    module Actions
      module Showable
        extend ActiveSupport::Concern

        def act
          resource
        end
      end
    end
  end
end
