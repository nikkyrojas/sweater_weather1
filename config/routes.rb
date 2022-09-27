Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
      resources :forecast, only: [:index]
      resources :breweries, only: [:index]
      resources :users, only: [:index, :create]
    end
  end
end

