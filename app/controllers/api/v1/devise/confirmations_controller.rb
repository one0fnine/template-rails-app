module Api
  module V1
    module Devise
      class ConfirmationsController < ::Devise::ConfirmationsController
        include Rescueable
        include Respondable
        include PathFetchable

        protected

        def respond_with(result, _options = {})
          if resource.persisted?
            super resource, serializer: Api::V1::AccountSerializer
          else
            render_unprocessable_entity result
          end
        end
      end
    end
  end
end
