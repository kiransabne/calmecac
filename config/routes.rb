Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  resources :courses do
    member do
      post :inscribe
    end
  end

  resources :inscriptions do
    resources :sections, only: [:show, :update] do
      resources :activities, only: [:update]
    end
  end

  get 'my_classroom', to: 'my_classroom#index'

  root to: 'home#index'
end
