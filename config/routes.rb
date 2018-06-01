Rails.application.routes.draw do

  root 'application#home'
  resources :users, param: :slug do
    resources :budgets
  end
  resources :budgets do
    resources :transactions
  end
  get '/signup', to: 'users#new'
  get '/profile', to: 'users#show'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get 'update', to: 'users#update', as: :update_user
  delete '/logout', to: 'sessions#destroy'
end
