module Api
  module V1
    module Devise
      class PasswordsController < ::Devise::PasswordsController
        include Rescueable
        include Respondable
        include PathFetchable

        protected

        def after_resetting_password_path_for(_resource)
        end

        def respond_with(result, *_args)
          if resource.persisted?
            render_success
          else
            render_unprocessable_entity result
          end
        end

        def resource_params
          params.from_jsonapi.fetch(:account, {})
        end
      end
    end
  end
end
