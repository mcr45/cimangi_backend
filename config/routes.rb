Rails.application.routes.draw do
  #get 'sessions/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  post "/login", to:"sessions#create"
  resources :users
  get 'bestpost',to:'posts#best_post'
  resources :posts do
    resource :comments
  end
  #get 'newpost',to:"posts#new_index"
  resources :recipes do
    resource :comments
  end
  # Defines the root path route ("/")
  # root "posts#index"
end
