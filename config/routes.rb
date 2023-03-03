Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/users/find', to: 'users_search#show'
      get '/users/:id/trips/find_all', to: 'users/trips/find_all#index'

      resources :users, except: [:index] do
        resources :trips, only: [:update, :destroy], controller: 'users/user_trips'
      end
      
      resources :trips, only: [:show, :create, :update, :destroy] do
        get '/users', to: 'trip/users#index'
        resources :flights, only: [:index, :create], controller: 'trips/flights'
        resources :trip_attendees, only: [:create]
      end
    end
  end

  # namespace :api do
  #   namespace :v1 do
  #     get '/users/find', to: 'users_search#show'
  #     get '/users/:id/trips/find_all', to: 'users/trips/find_all#index'

  #     resources :users, only: [:index, :show, :create, :update, :destroy] do
  #       resources :trips, only: [:index, :update, :destroy, :create], controller: 'users/user_trips'
  #     end
      
  #     resources :trips, only: [:index, :show, :create, :update, :destroy] do
  #       resources :events, only: [:index], controller: 'trips/events'
  #       resources :flights, only: [:index, :create], controller: 'trips/flights'
  #       resources :users, only: [:index], controller: 'trips/users'
  #     end
  #   end
  # end
end
