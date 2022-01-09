module Api
  module PathFetchable
    extend ActiveSupport::Concern

    private

    def action_options
      self
    end

    def base_namespace
      self.class.name.deconstantize.underscore
    end

    def current_namespace
      controller_name.remove("_controller").pluralize
    end

    def current_base_class
      "#{base_namespace}/#{current_namespace}/base".camelize.constantize
    end

    def current_serializer_class
      "#{base_namespace}/#{serializer_name}".camelize.constantize
    end

    def current_base_instance
      current_base_class.new action_options
    end

    def controller_name
      @controller_name ||= self.class.name.demodulize.underscore
    end

    def serializer_name
      controller_name.remove("_controller").singularize << "_serializer"
    end
  end
end
