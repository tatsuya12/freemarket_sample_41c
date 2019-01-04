Rails.application.routes.draw do
root 'items#index'
get 'items/detail' => 'items#detail'
get 'items/show' => 'items#show'
resources :items


end

