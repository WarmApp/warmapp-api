class Api::V1::BaseController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: {
      error: {
        message: parse(e.message),
        class: e.class,
      }
    }, status: 404
  end

  rescue_from ApplicationError do |e|
    render json: {
      error: {
        message: parse(e.message),
        class: e.class,
        status: e.status
      }
    }, status: e.status
  end

  def parse(message)
    begin
      return JSON.parse(message)
    rescue JSON::ParserError
      return message
    end
  end
end
