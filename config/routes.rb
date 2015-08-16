Rails.application.routes.draw do
  devise_for :users
  get 'persons/profile'
  resources :users
  root 'persons#profile'
end
