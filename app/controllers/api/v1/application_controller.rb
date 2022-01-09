module Api
  module V1
    class ApplicationController < V1::ApplicationController
      include Respondable
      include Paginationable

      def self.respond_with(*actions, status:)
        actions.each do |action_name|
          define_method action_name do
            send(:"render_#{status}")
          end
        end
      end

      respond_with :destroy, status: :no_content

      before_action :fetch_resource

      attr_reader :resource

      protected

      def fetch_resource
        @resource = current_base_instance.send action_name
      end

      def serializer_options
        {}
      end

      private

      def action_missing(method, *_args, &_block)
        respond_with resource, serializer_options
      end
    end
  end
end
