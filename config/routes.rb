Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :update, :destroy]
<<<<<<< HEAD
      resources :trips, only: [:index, :show, :create, :destroy]
=======
      resources :trips, only: [:index, :show, :create, :update]
>>>>>>> 00ce15b46be2b7c7f9447efa791213deeb3e7d49
    end
  end
end
