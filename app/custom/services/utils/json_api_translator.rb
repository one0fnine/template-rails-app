module  Services
  module Utils
    class JsonApiTranslator
      include JsonApi::Parameters

      def self.jsonapify(*args)
        instance = new
        instance.stack_limit = 6
        instance.jsonapify(*args)
      end

      protected

      # The gem does not have a logic to parse array of parameters
      # @jsonapi_unsafe_hash is a cache for params.to_unsafe_h
      # @jsonapi_unsafe_params is a cache for prepared params
      def formed_parameters
        return(super) unless update_to_many?

        formed_parameters_array
      end

      def formed_parameters_array
        @formed_parameters_array ||=
          @jsonapi_unsafe_hash[:data].each_with_object({}) { |param, memo|
            @jsonapi_unsafe_hash = {data: param}

            memo[jsonapi_main_body[:id]] = jsonapi_main_body.except(:id)
            @jsonapi_unsafe_params = nil
          }
      end

      def update_to_many?
        @jsonapi_unsafe_hash[:data].is_a?(Array)
      end
    end
  end
end
