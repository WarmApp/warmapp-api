class RoutingError < ApplicationError
  def initialize
    @status = 404
    @class = :RoutingError
    super("Endpoint requested not found.")
  end
end
