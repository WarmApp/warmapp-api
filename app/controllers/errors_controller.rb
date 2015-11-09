class ErrorsController < ApplicationController
  def routing
    fail RoutingError.new
  end
end
