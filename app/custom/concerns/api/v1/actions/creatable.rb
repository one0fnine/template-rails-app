module Api
  module V1
    module Actions
      module Creatable
        extend ActiveSupport::Concern

        module Translatable
          extend ActiveSupport::Concern
          include Actions::Adapterable

          included do
            include Actions::Creatable
            include Actions::Transactionable

            after_act :translate
          end

          def translate
            ::Translates::Base.create_for(resource,
              default: true,
              locale: user.current_venue.default_locale)
          end

          protected

          def adapter_options
            [collection.new]
          end
        end

        def act
          self.resource = collection.create! params
        end
      end
    end
  end
end
