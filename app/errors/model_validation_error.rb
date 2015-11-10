class ModelValidationError < ApplicationError
  def initialize(errors)
    @class = "ModelValidationError"
    @status = 400
    super errors.messages.to_json
  end
end
