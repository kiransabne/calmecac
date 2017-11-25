Rails.application.routes.draw do
  resources :activities
  resources :resources
  resources :sections
  resources :courses
  devise_for :users
end
