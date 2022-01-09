module Api
  module V1
    module Actions
      module Paginationable
        extend ActiveSupport::Concern

        protected

        def force_pagination?
          options[:force_pagination] || options.key?(:page)
        end

        private

        def paginate(collection, number: 1, size: 5)
          return collection unless force_pagination?

          collection.page(number).per(size)
        end
      end
    end
  end
end
