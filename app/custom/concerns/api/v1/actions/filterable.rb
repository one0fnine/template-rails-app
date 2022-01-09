module Api
  module V1
    module Actions
      module Filterable
        extend ActiveSupport::Concern

        private

        def filter_by(collection, **filter)
          collection.where(filter.compact_blank)
        end
      end
    end
  end
end
