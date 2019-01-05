Rails.application.routes.draw do
  devise_for :users
root 'items#index'
get 'items/mypage' => 'items#mypage'
get 'items/user_confirmation' => 'items#user_confirmation'
resources :items
  get 'items/detail' => 'items#detail'
  get 'items/show' => 'items#show'
end

