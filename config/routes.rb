Rails.application.routes.draw do
  devise_for :users
root 'items#index'
get 'items/mypage' => 'items#mypage'
resources :items
end
