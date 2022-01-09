module Api
  module V1
    module Paginationable
      extend ActiveSupport::Concern

      def force_pagination?
        !!page_params[:size]
      end

      private

      def pagination_meta
        return {} unless paginatable?

        {
          page: {
            total: resource.total_count,
            current_page: resource.current_page,
            per_page: resource.limit_value,
            last_page: resource.total_pages
          }
        }
      end

      def page_params
        @page_params ||= params.to_unsafe_h[:page] || {}
      end

      def paginatable?
        force_pagination? && resource.respond_to?(:current_page)
      end
    end
  end
end
