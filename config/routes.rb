Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :bank_accounts
  root to: 'bank_accounts#index'
  resources :users do
    member do
      get 'new_withdraw'
      post 'withdraw'
    end
  end
end
