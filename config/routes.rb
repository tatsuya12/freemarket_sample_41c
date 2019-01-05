Rails.application.routes.draw do
  devise_for :users
<<<<<<< HEAD
root 'items#index'
get 'items/mypage' => 'items#mypage'
get 'items/user_confirmation' => 'items#user_confirmation'
resources :items
=======
  root 'items#index'
  get 'items/user_confirmation' => 'items#user_confirmation'
  get 'items/detail' => 'items#detail'
  get 'items/show' => 'items#show'
  resources :items
>>>>>>> master
end

