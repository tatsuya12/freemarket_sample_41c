Rails.application.routes.draw do
<<<<<<< HEAD
 devise_for :users, :controllers => {
  :registrations => ‘users/registrations’,
  :sessions => ‘users/sessions’,
  :passwords => ‘users/passwords’,
  :confirmations => ‘users/confirmations’,
  :omniauth_callbacks => ‘users/omniauth_callbacks’,
  :unlocks => ‘users/unlocks’
}
 devise_scope :user do
  get “sign_in”, :to => “users/sessions#new”
  get “sign_out”, :to => “users/sessions#destroy”
 end
=======
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
   delete "sign_out", :to => "users/sessions#destroy"
  end
>>>>>>> master


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


 root ‘items#index’
 resources :items do
   collection do
     get :detail
   end
 end
end