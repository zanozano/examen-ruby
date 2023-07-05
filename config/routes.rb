Rails.application.routes.draw do
  namespace :admin do
    get 'users/new'
    get 'users/create'
  end

  devise_for :users

  get 'contact', to: 'contact#index'
  get 'terms', to: 'terms#index'

  post 'messages', to: 'contact#create', as: 'messages'

  root 'home#index'
end
