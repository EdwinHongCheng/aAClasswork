Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    # Your routes here
    resources :guests, only: [:show, :index] do
      resources :gifts, only: :index
    end

    resources :gifts, only: :show
    resources :parties, only: [:show, :index]
  end

end
