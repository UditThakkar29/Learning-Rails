Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "movies#index"
  get "/movies/:id/comments", to: "comments#index"

  resources :movies do
    resources :comments
  end
end
