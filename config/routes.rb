Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :events, :only => [:show]
      resources :tracks, :only => [:show, :create, :update]
      resources :playlists, :only => [:show, :create, :update]
    end
  end
end
