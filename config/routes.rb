Rails.application.routes.draw do
  get 'donor_sessions/create'

  get 'donor_sessions/destroy'

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :organizations, OrganizationLogin::Devise.config
  # as :organization do
  #   get 'enterprise_account/edit' => 'rocket_enterprise/devise/registrations#edit', :as => 'edit_enterprise_user_registration'
  #   patch 'enterprise_account' => 'rocket_enterprise/devise/registrations#update', :as => 'enterprise_user_registration'
  # end
  ActiveAdmin.routes(self)

  root to: "home#index"

  get 'donor/login/:token' => 'donor_sessions#create', as: 'donor_login'
  delete 'donor/logout' => 'donor_sessions#destroy', as: 'donor_logout'

end
