Wish::Application.routes.draw do
  get "wishes/index"
  root 'wishes#index'
  get '/auth/:provider/callback', to: 'sessions#create'

end
