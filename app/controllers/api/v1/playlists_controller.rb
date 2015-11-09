class Api::V1::PlaylistsController < Api::V1::BaseController
  def show
    render json: Playlist.find(params[:id]), status: 200
  end

  def create
    playlist = Playlist.new(playlist_params)
    if playlist.save
      render json: playlist, status: 200
    else
      render json: { errors: playlist.errors }, status: 422
    end
  end

  def update
    playlist = Playlist.find(params[:id])
    if playlist.update(playlist_params)
      render json: playlist, status: 200
    else
      render json: { errors: playlist.errors }, status: 422
    end
  end

private

  def playlist_params
    params.require(:playlist).permit(:name, :fb_event_id)
  end
end
