Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'

  namespace 'admin' do
    resources :gifs, only: [:create]
  end

  resources :users, only: [:new, :create, :show] do
    resources :favorites, only: [:create, :destroy]
  end
  resources :gifs, only: [:index, :update]
  resources :categories, only: [:show,:destroy]
end
