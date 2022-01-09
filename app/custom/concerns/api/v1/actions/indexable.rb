module Api
  module V1
    module Actions
      module Indexable
        extend ActiveSupport::Concern

        included do
          include V1::Actions::Paginationable
          include V1::Actions::Filterable
        end

        def act
          paginate \
            filter_by(collection, **options.fetch(:filter, {})),
            **options.fetch(:page, {})
        end
      end
    end
  end
end
