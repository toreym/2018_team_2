class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_donor

  def current_donor=(donor)
    if donor
      session[:donor_id] = donor.id
    else
      session.delete :donor_id
    end
  end

  def current_donor
    Donor.find_by(id: session[:donor_id])
  end

  rescue_from CanCan::AccessDenied do |exception|
    Rails.logger.debug "Access denied on #{exception.action} #{exception.subject.inspect}"
    # ...
  end

end
