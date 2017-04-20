Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users
  
  resources :matches

  namespace 'admin' do
    resources :matches
    resources :courses
    resources :users, only: [:index, :update]
  end
end
