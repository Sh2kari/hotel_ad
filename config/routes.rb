Rails.application.routes.draw do
  root to: 'hotels#index'

  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout' }

  resources :ratings
  resources :hotels
  resources :comments
end
