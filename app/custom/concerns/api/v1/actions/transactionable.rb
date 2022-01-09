module Api
  module V1
    module Actions
      module Transactionable
        extend ActiveSupport::Concern

        def call
          ActiveRecord::Base.transaction do
            super
          end
        end
      end
    end
  end
end
