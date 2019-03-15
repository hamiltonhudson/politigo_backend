Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create]
      resources :events, only: [:index, :show]
      resources :user_events
    end
  end
end
