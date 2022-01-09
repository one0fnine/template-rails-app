module Api
  module V1
    module Devise
      module Registrations
        module Actions
          class CreateAction < ::Application::Action
            include Api::V1::Actions::Showable

            protected

            def resource
              @resource ||= Account.new(params)
            end
          end
        end
      end
    end
  end
end
