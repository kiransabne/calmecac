Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  resources :sections
  resources :courses

  get 'my_classroom', to: 'my_classroom#index'

  root to: 'home#index'
end
