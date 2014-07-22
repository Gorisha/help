ActivityHelper::Application.routes.draw do
  devise_for :users
  root 'home#index'
  match 'users/:user_id/new', to: 'home#new', via: 'get'
  resources :users do
    resources :activities do
      resources :comments
    end
    resources :messages
  end
end
