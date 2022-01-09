# frozen_string_literal: true

class AppConfig < ApplicationConfig
  attr_config :database
  required :database

  def database
    super.tap {
      _1[:name] ||= "#{Rails.application.class.module_parent_name.underscore}_#{Rails.env}"
    }
  end
end
