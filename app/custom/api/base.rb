class Api::Base
  include ActiveSupport::Callbacks

  def initialize(context)
    @context = context
    @jsonapi_params = {}
  end

  class << self
    def permitted_actions(*actions)
      self.actions = actions
      define_callbacks(*actions)

      actions.each do |action|
        define_method action do
          validate_params!(action) if needs_to_validate_params?
          prepare_jsonapi_params if needs_to_prepare_params?

          run_callbacks action do
            action_class(action).new(current_account, params: params, options: query_params).call
          end
        end
      end
    end

    %i[after before].each do |direction|
      define_method "#{direction}_action" do |method_name, only: actions|
        Array(only).each do |action|
          set_callback action, direction, method_name
        end
      end
    end

    %i[prepare validate].each do |method_name|
      define_method "#{method_name}_params_for" do |*actions|
        define_method "needs_to_#{method_name}_params?" do
          actions.include?(:all) || actions.include?(@context.action_name.to_sym)
        end
      end
    end

    %i[validation query].each do |type|
      define_method "#{type}_keys" do |*keys|
        define_method "#{type}_keys" do
          keys
        end
      end
    end

    def data_type(type)
      define_method :data_type do
        type
      end
    end

    attr_accessor :actions
  end

  attr_reader :context
  delegate :current_account, to: :context
  prepare_params_for :create, :update
  validate_params_for :all
  validation_keys :data, :page, :filter, :included, :id, :slug, :menu_id, :section_id, :item_id
  query_keys :page, :filter, :includes, :locale, :id, :slug, :menu_id, :section_id, :item_id

  private

  %w[action contract].each do |type|
    define_method "#{type}_class" do |class_name|
      "#{base_namespace}/#{type.pluralize}/#{class_name}_#{type}".camelize.constantize
    end
  end

  def base_namespace
    self.class.name.deconstantize.underscore
  end

  def contract_entities
    {user: current_account}
  end

  def query_params
    @options ||= @context.params.slice(*query_keys).to_unsafe_h.deep_symbolize_keys
  end

  def params
    (@jsonapi_params.presence || @context.params.to_unsafe_h).deep_symbolize_keys
  end

  def prepare_jsonapi_params
    @jsonapi_params = ::Services::Utils::JsonApiTranslator.jsonapify(params).fetch(data_type)
  end

  def validate_params!(class_name)
    contract_class(class_name)
      .new(entities: contract_entities).call(params.slice(*validation_keys))
      .tap do |result|
        next if result.success?

        raise Api::V1::ParametersValidationError.new(result, errors: result.errors)
      end
  end
end
