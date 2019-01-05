Rails.application.routes.draw do
root 'items#index'
get 'items/mypage' => 'items#mypage'
get 'items/user_confirmation' => 'items#user_confirmation'

  devise_for :users, :controllers => {
   :registrations => 'users/registrations',
   :sessions => 'users/sessions',
   :passwords => 'users/passwords',
   :confirmations => 'users/confirmations',
   # :omniauth_callbacks => 'users/omniauth_callbacks',
   :unlocks => 'users/unlocks'
 }

 devise_scope :user do
   get "sign_in", :to => "users/sessions#new"
   get "sign_out", :to => "users/sessions#destroy"
 end
  get 'items/detail' => 'items#detail'
  get 'items/show' => 'items#show'
resources :items

end

