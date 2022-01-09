module Api
  module V1
    module Respondable
      extend ActiveSupport::Concern

      protected

      def pagination_meta
        {}
      end

      def respond_with(resource, options = {})
        render json: resource_serializer(resource, meta: meta, **options)
      end

      def render_accepted
        head :accepted
      end

      def render_no_content
        head :no_content
      end

      def render_success
        head :ok
      end

      def render_bad_request(exception)
        render_error exception, error_serializer_params(status: :bad_request)
      end

      def render_unprocessable_entity(exception)
        render_error exception, error_serializer_params(status: :unprocessable_entity)
      end

      def render_not_found(exception)
        render_error exception, error_serializer_params(status: :not_found)
      end

      def render_forbidden(exception)
        render_error exception, error_serializer_params(status: :forbidden)
      end

      private

      def error_serializer_params(**options)
        {params: options.tap { _1[:request_id] = request.uuid }}
      end

      def meta
        {}.tap { _1.merge! pagination_meta }
      end

      def render_error(exception, options = {})
        render json: ::ErrorSerializer.serialize_to_json(exception, options),
               status: options.dig(:params, :status)
      end

      def resource_serializer(resource, **options)
        serializer = options.fetch(:serializer) { current_serializer_class }
        serializer.serialize_to_json(resource,
          options.slice(:fields, :include, :params, :meta, :is_collection))
      end
    end
  end
end
