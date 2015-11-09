class Api::V1::EventsController < Api::V1::BaseController
  def show
    event = Facebook::Event.new(params[:id])
    repository = Facebook::EventRepository.new
    render json: repository.load!(event), status: 200
  end
end
