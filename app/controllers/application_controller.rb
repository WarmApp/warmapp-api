class ApplicationController < ActionController::API
  before_filter -> { request.format = :json }

  include ActionController::Serialization

  rescue_from ApplicationError do |e|
    render json: {
      error: {
        message: e.message,
        class: e.class,
        status: e.status
      }
    }, status: e.status
  end
end
