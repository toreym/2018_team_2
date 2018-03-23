Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :donors
  devise_for :organizations
  root to: "home#index"

  resources :funding_needs do
    
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
