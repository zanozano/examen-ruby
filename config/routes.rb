Rails.application.routes.draw do
  namespace :admin do
    get 'users/new'
    get 'users/create'
  end

  devise_for :users

  get 'contact', to: 'contact#index'
  get 'terms', to: 'terms#index'

  post 'contact', to: 'contact#create', as: 'contact_create'

  root 'home#index'
end
