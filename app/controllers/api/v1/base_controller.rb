class Api::V1::BaseController < ApplicationController
  protect_from_forgery with: :null_session

  respond_to :json

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

protected

  def record_not_found
    return head status: 404
  end
end
