Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # resources :events, except: [:new, :edit]
      # resources :users, except: [:new, :edit]
      resources :events
      resources :users
      patch "/events/:id/add", to: "events#add"
      patch "/events/:id/remove", to: "events#remove"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    end
  end
end
