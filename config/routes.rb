Rails.application.routes.draw do
  devise_for :users
root 'items#index'
get 'items/user_confirmation' => 'items#user_confirmation'
resources :items
# get 'tweet/show' => 'tweet#show'
end
