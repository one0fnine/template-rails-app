module Api
  module V1
    module Actions
      module Adapterable
        extend ActiveSupport::Concern

        included do
          before_act :decorate
        end

        def decorate
          self.params = current_adapter.decorate(params)
        end

        protected

        def adapter_options
          []
        end

        def current_adapter
          self.class::CURRENT_ADAPTER.constantize.new(*adapter_options)
        end
      end
    end
  end
end
