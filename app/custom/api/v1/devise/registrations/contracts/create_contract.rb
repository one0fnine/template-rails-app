module Api
  module V1
    module Devise
      module Registrations
        module Contracts
          class CreateContract < Dry::Validation::Contract
            config.validate_keys = true
            option :entities

            params do
              required(:data).hash do
                required(:type).filled(:string, eql?: "accounts")
                required(:attributes).hash do
                  required(:email).filled(:string)
                  required(:password).filled(:string)
                end
              end
            end
          end
        end
      end
    end
  end
end
