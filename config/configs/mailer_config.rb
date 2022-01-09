# frozen_string_literal: true

class MailerConfig < ApplicationConfig
  attr_config :default_url_options
  required :default_url_options
end
