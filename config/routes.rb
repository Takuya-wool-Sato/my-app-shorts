Rails.application.routes.draw do
  devise_for :users
  resources :posts
  get '/list' => 'posts#list'
  get '/profile' => 'profile#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root to: 'posts#index'
end
