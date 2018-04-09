Rails.application.routes.draw do

  root 'application#home'
  resources :users do
    resources :budgets
  end
  resources :budgets do
    resources :transactions
  end
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
