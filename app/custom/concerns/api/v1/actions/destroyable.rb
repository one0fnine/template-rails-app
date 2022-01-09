module Api
  module V1
    module Actions
      module Destroyable
        extend ActiveSupport::Concern

        def act
          resource.destroy!
        end
      end
    end
  end
end
