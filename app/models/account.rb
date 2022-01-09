class Account < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :confirmable, :validatable,
    :jwt_authenticatable, jwt_revocation_strategy: self

  encrypts :email

  has_many :allowlisted_jwts, dependent: :delete_all
end
