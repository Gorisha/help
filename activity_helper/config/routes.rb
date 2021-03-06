ActivityHelper::Application.routes.draw do
  root 'home#index'
  get "replies/new"
  get "replies/create"
  get "replies/index"
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  match 'users/:user_id/new', to: 'home#new', via: 'get'
  resources :users do
    resources :activities do
      resources :comments
    end
    resources :messages, only: [:new, :create] do
    resources :replies
  end
  end
  match 'users/:user-id/messages' , to: 'messages#messages' , via: 'get'
  match "messages", to: "messages#messages", via: [:get]
end
 