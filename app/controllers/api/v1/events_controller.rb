class Api::V1::EventsController < Api::V1::BaseController
  def show
    event = Facebook::Event.new(params[:id])
    event.load!
    render json: event, status: 200
  end
end
