Rails.application.routes.draw do
  root to: "errors#routing"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :events, only: [:show]
      resources :tracks, only: [:show, :create, :update]
      resources :playlists, only: [:show, :create, :update] do
        resources :tracks, only: [:index]
      end
    end
  end

  get    "*a", to: "errors#routing"
  post   "*a", to: "errors#routing"
  put    "*a", to: "errors#routing"
  delete "*a", to: "errors#routing"
end
