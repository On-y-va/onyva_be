Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/users/find', to: 'users_search#show'
      get '/users/:id/trips/find_all', to: 'users/trips/find_all#index'

      resources :users, only: [:index, :show, :create, :update, :destroy] do
        resources :trips, only: [:index, :update, :create, :destroy], controller: 'users/user_trips'
      end
      
      resources :trips, only: [:index, :show, :create, :update, :destroy] do
        resources :events, only: [:index], controller: 'trips/events'
        resources :flights, only: [:index, :create], controller: 'trips/flights'
        resources :users, only: [:index], controller: 'trips/users'
      end
    end
  end
end
