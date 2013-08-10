Blog::Application.routes.draw do
  root to: "posts#index"

  namespace :admin do
    root to: "posts#index"
    resources :posts do
      member do
        post :publish
        post :hide
        post :visible
      end
    end
    resources :tags
    resources :categories
    resources :comments
  end

  match 'logout', to: 'user_sessions#destroy'
  match 'login', to: 'user_sessions#new', as: "login"
  match 'about', to: 'static_pages#about'
  resources :user_sessions, only: [:create]
  resources :posts
  resources :tags
  resources :categories
  resources :comments
end
