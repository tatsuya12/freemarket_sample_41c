Rails.application.routes.draw do
root 'items#index'
resources :items
get 'tweet/show' => 'tweet#show'
end
