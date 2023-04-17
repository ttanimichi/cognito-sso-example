Rails.application.routes.draw do
  root 'welcome#index'
  get 'sessions/new'
  get '/auth/cognito-idp/callback' => 'sessions#create'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
