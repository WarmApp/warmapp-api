class UnauthenticatedError < ApplicationError
  def initialize
    @status = 401
    @class = "UnauthenticatedError"
    super "User not authenticated"
  end
end
