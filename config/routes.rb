Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :organizations, OrganizationLogin::Devise.config
  ActiveAdmin.routes(self)

  root to: "home#index"

  resources :funding_needs do

  end
  #TODO: add interests model that will store
  #all the known interests
  #probably remove some of those fields from fields_of_interest
  get 'get_funding_needs' => 'funding_needs#get_funding_needs', as: 'get_funding_needs', defaults: { format: 'json' }

  get 'get_field_of_interests' => 'field_of_interests#get_field_of_interests', as: 'get_field_of_interests', defaults: { format: 'json' }
  get 'get_user_field_of_interests' => 'field_of_interests#get_user_field_of_interests', as: 'get_user_field_of_interests', defaults: { format: 'json' }

  get 'donor/login/:token' => 'donor_sessions#create', as: 'donor_login'
  delete 'donor/logout' => 'donor_sessions#destroy', as: 'donor_logout'

end
