class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_donor

  def current_donor=(donor)
    session[:donor_id] = donor.id
  end

  def current_donor
    Donor.find_by(id: session[:donor_id])
  end

end
