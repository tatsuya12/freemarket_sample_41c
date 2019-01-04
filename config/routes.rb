Rails.application.routes.draw do
  devise_for :users
root 'items#index'
<<<<<<< HEAD
get 'items/mypage' => 'items#mypage'
=======
get 'items/user_confirmation' => 'items#user_confirmation'
>>>>>>> master
resources :items
end
