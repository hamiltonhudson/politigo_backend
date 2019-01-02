Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # resources :events, except: [:new, :edit]
      # resources :users, except: [:new, :edit]
      resources :events
      resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    end
  end
end
