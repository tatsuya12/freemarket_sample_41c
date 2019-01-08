Rails.application.routes.draw do
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


  root 'items#index'
  get 'items/user_confirmation' => 'items#user_confirmation'
  get 'items/detail' => 'items#detail'
  get 'items/logout' => 'items#logout'
  get 'items/show' => 'items#show'
  get 'items/credit' => 'items#credit'
  get 'items/credit_detail' => 'items#credit_detail'
  get 'items/profile' => 'items#profile'
  get 'items/sell' => 'items#sell'
  resources :items
end

