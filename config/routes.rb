Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  get 'items/user_confirmation' => 'items#user_confirmation'
  get 'items/detail' => 'items#detail'
  get 'items/show' => 'items#show'
  resources :items
end

