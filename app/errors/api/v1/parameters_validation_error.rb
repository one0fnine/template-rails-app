class Api::V1::ParametersValidationError < StandardError
  def initialize(validator, errors: [])
    @validator = validator
    @validator_errors = errors
    super()
  end

  def message
    errors.map do |error|
      path = CGI.unescape(error.path.reverse.inject(nil) { |a, n| {n => a} }.to_query)[0...-1]
      text = error.text
      "#{path} #{text}"
    end
  end

  private

  def errors
    @validator_errors.presence || @validator.errors
  end
end
