Rails.application.routes.draw do
  root to: 'hotels#index'

  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout' }

  resources :hotels
  resources :ratings
  resources :comments
end
