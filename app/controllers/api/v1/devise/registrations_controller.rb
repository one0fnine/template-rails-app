module Api
  module V1
    module Devise
      class RegistrationsController < ::Devise::RegistrationsController
        include Respondable
        include Api::Rescueable
        include Api::PathFetchable

        protected

        def build_resource(_)
          self.resource = current_base_instance.send action_name
        end

        def respond_with(resource, **_options)
          if resource.persisted?
            super resource, serializer: Api::V1::AccountSerializer
          else
            render_unprocessable_entity resource.errors
          end
        end

        def sign_up(resource_name, resource)
          sign_in(resource_name, resource, store: false)
        end
      end
    end
  end
end
