Rails.application.routes.draw do

  root 'application#home'
  resources :users
  resources :budgets
  resources :transactions
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
