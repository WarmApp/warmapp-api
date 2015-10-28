class Api::V1::EventsController < Api::V1::BaseController
  def show
    event = Facebook::Event.new(params[:id])
    render json: { meta: event.metadata, data: event.feeds }, status: 200
  end
end
