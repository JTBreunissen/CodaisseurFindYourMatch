Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  namespace 'admin' do
    resources :coursedays, only: [:index]
    resources :users, only: [:index, :update]
  end
end
