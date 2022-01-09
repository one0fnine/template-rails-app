module Api
  module V1
    module Devise
      class SessionsController < ::Devise::SessionsController
        include Respondable
        include Api::Rescueable
        include Api::PathFetchable

        protected

        def respond_with(*_)
          super(resource, serializer: Api::V1::AccountSerializer)
        end

        def respond_to_on_destroy
          head :no_content
        end
      end
    end
  end
end
