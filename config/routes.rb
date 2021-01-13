Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'tweets#index'
  resources :tweets, except: %i[new] do
    resources :comments, only: %i[create edit update destroy]
  end
end
