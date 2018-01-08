Rails.application.routes.draw do
  devise_for :users, controllers: {
               registrations: "registrations"
             }

  resources :courses do
    member do
      post :inscribe
      get :stats
    end
  end

  resources :inscriptions do
    resources :sections, only: [:show, :update] do
      resources :activities, only: [:update]
    end
  end

  get 'edit_user', to: 'users#edit'
  put 'update_user', to: 'users#update'
  get 'my_classroom', to: 'my_classroom#index'
  get 'my_courses', to: 'my_courses#index'

  root to: 'home#index'
end
