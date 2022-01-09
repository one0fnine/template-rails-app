class Api::V1::Devise::Registrations::Base < Api::Base
  data_type :account
  permitted_actions :create
end
