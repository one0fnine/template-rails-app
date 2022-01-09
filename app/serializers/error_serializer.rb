class ErrorSerializer < BaseSerializer
  def initialize(exception, options)
    @exception = exception
    @options = options
  end

  def serializable_hash
    {errors: errors}
  end

  private

  def code
    Rack::Utils::SYMBOL_TO_STATUS_CODE[status]
  end

  def errors
    Array(exception_message || @exception.try(:full_messages)).map do |message|
      {}.tap do
        _1[:id] = @options.dig(:params, :request_id)
        _1[:status] = status
        _1[:code] = code
        _1[:title] = title
        _1[:detail] = message
      end
    end
  end

  def exception_message
    case @exception
    when ActiveRecord::RecordNotFound
      "Couldn't find #{@exception.model}"
    when ActiveRecord::RecordNotUnique
      "Record is not unique"
    else
      @exception.try :message
    end
  end

  def status
    @status ||= @options.dig(:params, :status)
  end

  def title
    I18n.t status, scope: :errors, default: :default
  end
end
