Rails.application.routes.draw do
  resources :products
  # devise_for :users
  devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_scope :user do
    get '/users/sign_out', to: 'users/sessions#destroy'
  end
  root 'products#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
