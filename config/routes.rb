Rails.application.routes.draw do
  resources :categories
  resources :settings
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :posts
  get '/list' => 'posts#list'
  get '/profile' => 'profile#index'
  get '/setting' => 'settings#edit'
  get '/update' => 'update#index'
  post '/ask', to: 'chat#ask'
  get '/ask', to: 'chat#ask'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  devise_scope :user do
    get '/users/destroy' => 'users/registrations#destroy'
  end

  root to: 'posts#index'
end
