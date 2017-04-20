Rails.application.routes.draw do
  root to: 'matches#index'

  devise_for :users

  namespace 'admin' do
    resources :matches
    resources :courses
    resources :users, only: [:index, :update, :delete]
  end
end
