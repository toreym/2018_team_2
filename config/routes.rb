Rails.application.routes.draw do
  get 'donor_sessions/create'

  get 'donor_sessions/destroy'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :organizations

  root to: "home#index"

  get 'donor/login/:token' => 'donor_sessions#create', as: 'donor_login'
  delete 'donor/logout' => 'donor_sessions#destroy', as: 'donor_logout'

end
