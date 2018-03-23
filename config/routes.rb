Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :donors
  devise_for :organizations
  root to: "home#index"

  resources :funding_needs do

  end
  #TODO: add interests model that will store
  #all the known interests
  #probably remove some of those fields from fields_of_interest
  # post 'interests/:id/like/:organization_id'
  # post 'interests/:id/dislike/:organization_id'
  # get '/search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
