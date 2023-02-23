Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :update, :destroy]
      resources :trips, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
