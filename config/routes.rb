require "utils/simple_response"

def render_404
  Utils::SimpleResponse.render_not_found
end

def render_pong
  Utils::SimpleResponse.render_pong
end

Rails.application.routes.draw do
  default_url_options AppConfig.default_url_options

  root to: ->(_env) { render_404 }, via: :all

  constraints subdomain: AppConfig.domains[:backoffice] do
    get "/ping", to: ->(_) { render_pong }, via: :all
  end

  namespace :api, defaults: {format: :json}, as: nil do
    namespace :v1, as: nil do
      devise_for :accounts, only: [], path: "", module: "api/v1/devise"

      as :account do
        resource :password, only: [], module: :devise do
          post :create
          put :update
        end

        resource :session, only: [], path: "", module: :devise do
          post :create, path: :sign_in
          delete :destroy, path: :sign_out
        end

        resource :registration, only: [], path: "", module: :devise do
          post :create, path: :sign_up
        end

        resource :confirmation, only: [], path: "", module: :devise do
          get :show, path: :confirm_email
        end
      end
    end
  end

  match "*path", to: ->(_env) { render_404 }, via: :all
end
