Wish::Application.routes.draw do
  resources :wishes
  root 'wishes#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  get 'signout', to: 'sessions#destroy'
end
