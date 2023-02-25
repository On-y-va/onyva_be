Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/users/find', to: 'users_search#show'
      get '/users/:id/trips/find_all', to: 'users/trips/find_all#show'

      resources :users, only: [:index, :show, :create, :update, :destroy] do
        resources :trips, only: [:index], controller: 'users/trips'
      end
      resources :trips, only: [:index, :show, :create, :update, :destroy] do
        resources :flights, only: [:index], controller: 'trips/flights'
      end
    end
  end
end
