class Api::V1::TracksController < Api::V1::BaseController
  def index
    render json: Track.where(playlist_id: params[:playlist_id]), status: 200
  end

  def show
    render json: Track.find(params[:id]), status: 200
  end

  def create
    track = Track.new(track_params)
    if track.save
      render json: track, status: 200
    else
      render json: { errors: track.errors }, status: 422
    end
  end

  def update
    track = Track.find(params[:id])
    if track.update(track_params)
      render json: track, status: 200
    else
      render json: { errors: track.errors }, status: 422
    end
  end

private

  def track_params
    params.require(:track).permit(:playlist_id, :caption, :link, :source,
      :name, :fb_message, :fb_user_id, :fb_user_name)
  end
end
