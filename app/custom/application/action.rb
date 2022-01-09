module Application
  class Action
    include ActiveSupport::Callbacks

    COLLECTION_INCLUDES = [].freeze

    def initialize(account, params: {}, options: {})
      @account = account
      @params = params
      @options = options
    end

    class << self
      %i[before after].each do |type|
        define_method "#{type}_act" do |method_name|
          set_callback :act, type, method_name
        end
      end
    end

    attr_reader :account, :options
    attr_accessor :params
    attr_writer :resource

    define_callbacks :act

    def call
      run_callbacks :act do
        act
      end
    end

    protected

    def act
    end

    def resource
      @resource ||= collection.find_by!({id: resource_id, slug: resource_slug}.compact)
    end

    private

    %i[slug id].each do |type|
      define_method "resource_#{type}" do
        options[type]
      end
    end
  end
end
