Rails.application.routes.draw do
  devise_for :users, controllers: {
    # deviseの階層を編集した場合は適宜pathを編集してください
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :users, only: [:show] 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :tweets do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end

  get 'hello/index' => 'hello#index'

  get 'hello/link' => 'hello#link'



  root 'hello#index'
end
