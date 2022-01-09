module Api
  module V1
    module Actions
      module Updateable
        module Translatable
          extend ActiveSupport::Concern
          include Actions::Adapterable

          included do
            include Actions::Updateable
            include Actions::Transactionable

            after_act :translate
          end

          def translate
            ::Translates::Base.update_for(resource, locale: user.current_venue.default_locale)
            ::Translates::Base.validate_for(resource)
          end

          protected

          def adapter_options
            [resource]
          end
        end
        extend ActiveSupport::Concern

        def act
          resource.tap { _1.update! params }.reload
        end
      end
    end
  end
end
