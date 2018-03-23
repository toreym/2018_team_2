require 'devise'

module OrganizationLogin
  module Devise

    def self.config
      config = {
          :path => :myorg,
          :controllers => OrganizationLogin::Devise.controllers,
          :path_names => { :sign_in => 'login', :sign_out => "logout" },
          :scoped_views => true
      }

      if ::Devise.respond_to?(:sign_out_via)
        logout_methods = [::Devise.sign_out_via, ActiveAdmin.application.logout_link_method].flatten.uniq
        config.merge!( :sign_out_via => logout_methods)
      end

      config
    end

    def self.controllers
      {
          :sessions => "organization_login/devise/sessions",
          :passwords => "organization_login/devise/passwords",
          :unlocks => "organization_login/devise/unlocks"
      }
    end

    module Controller
      extend ::ActiveSupport::Concern
      included do
        layout 'active_admin_organization_devise'
        helper ::ActiveAdmin::ViewHelpers
      end

      # Redirect to the default namespace on logout
      def root_path
        namespace = :myorg
        root_path_method = [namespace, :root_path].compact.join('_')

        url_helpers = Rails.application.routes.url_helpers

        path = if url_helpers.respond_to? root_path_method
                 url_helpers.send root_path_method
               else
                 # Guess a root_path when url_helpers not helpful
                 "/#{namespace}"
               end

        # NOTE: `relative_url_root` is deprecated by rails.
        #       Remove prefix here if it is removed completely.
        prefix = Rails.configuration.action_controller[:relative_url_root] || ''
        prefix + path
      end
    end

    class SessionsController < ::Devise::SessionsController
      include ::OrganizationLogin::Devise::Controller
    end

    class PasswordsController < ::Devise::PasswordsController
      include ::OrganizationLogin::Devise::Controller
    end

    class UnlocksController < ::Devise::UnlocksController
      include ::OrganizationLogin::Devise::Controller
    end

    class RegistrationsController < ::Devise::RegistrationsController
      include ::OrganizationLogin::Devise::Controller
    end

  end
end
