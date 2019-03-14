Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # resources :events, except: [:new, :edit]
      resources :events
      resources :users
      # patch "/events/:id/add", to: "events#add"
      # patch "/events/:id/remove", to: "events#remove"
      resources :user_events
    end
  end
end
