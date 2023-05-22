Rails.application.routes.draw do
  get 'home/index'

  resources :temps
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "home#index"
  get "/movies/:id/comments", to: "comments#index"

  resources :movies do
    get 'rooms/show', to: 'room#show'
    resources :comments
  end
  resources :apis do
    member do
      get :call_api
    end
  end
  mount ActionCable.server => '/cable'
end
