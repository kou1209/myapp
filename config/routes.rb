Rails.application.routes.draw do
  root   'static_pages#home'
  get    '/help',    to: 'static_pages#help'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  get    '/rules',   to: 'static_pages#rules'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers, :password_edit
    end
  end
  resources :microposts,          only: [:create, :destroy, :new] do
    resources :comments, only: [:create, :new]
  end
  resources :relationships,       only: [:create, :destroy]
end
