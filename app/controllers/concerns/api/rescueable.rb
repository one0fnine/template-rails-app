module Api
  module Rescueable
    extend ActiveSupport::Concern

    included do
      rescue_from ActiveRecord::RecordInvalid,
        with: :render_unprocessable_entity
      rescue_from ActiveRecord::RecordNotUnique,
        with: :render_unprocessable_entity
      rescue_from ActiveRecord::Rollback,
        with: :render_unprocessable_entity
      rescue_from ActiveSupport::MessageVerifier::InvalidSignature,
        with: :render_unprocessable_entity
      rescue_from ActiveModel::UnknownAttributeError,
        with: :render_unprocessable_entity
      rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
      rescue_from ActionController::ParameterMissing, with: :render_bad_request
    end
  end
end
