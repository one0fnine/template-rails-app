# frozen_string_literal: true

class DeviseConfig < ApplicationConfig
  attr_config :secret_key, :pepper, :jwt_key, :sender
  required :secret_key, :pepper, :jwt_key, :sender
end
