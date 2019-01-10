Rails.application.routes.draw do
root 'items#index'
get 'items/mypage' => 'items#mypage'
get 'items/user_confirmation' => 'items#user_confirmation'

  devise_for :users, :controllers => {
   :registrations => 'users/registrations',
   :sessions => 'users/sessions',
   :passwords => 'users/passwords',
   :confirmations => 'users/confirmations',
   :omniauth_callbacks => 'users/omniauth_callbacks',
   :unlocks => 'users/unlocks'
 }
  devise_scope :user do
   get "sign_in", :to => "users/sessions#new"
   get "sign_out", :to => "users/sessions#destroy"
<<<<<<< HEAD
 end
  get 'items/detail' => 'items#detail'
  get 'items/logout' => 'items#logout'
  get 'items/show' => 'items#show'
  get 'items/credit' => 'items#credit'
  get 'items/credit_detail' => 'items#credit_detail'
  get 'items/profile' => 'items#profile'
  resources :items
=======
  end


  resources :mypages do
    member do
      get :credit
      get :credit_detail
      get :user_confirmation
      get :profile
      get :logout
    end
    collection do
      get :sign_up_top
    end
  end


  root 'items#index'
  resources :items do
    collection do
      get :detail
    end
  end
>>>>>>> master
end

