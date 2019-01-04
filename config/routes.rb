Rails.application.routes.draw do
  devise_for :users
root 'items#index'
get 'items/detail' => 'items#detail'
get 'items/show' => 'items#show'
resources :items


end

