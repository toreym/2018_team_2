class DonorSessionsController < ApplicationController

  # create a donor session from a login link
  def create
    # Make sure the token is not expired and on the donor
    donor = Donor.where(login_token: params[:token]).where('login_token_expires > ?', Time.now).first

    if donor
      expire = AppSetting.get_setting('expire login link after login', default: 'yes')
      if expire == 'yes'
        donor.update_attributes({login_token: nil, login_token_expires: nil})
      end

      self.current_donor = donor
      redirect_to root_path, notice: 'Signed-in sucesfully'
    else
      redirect_to root_path, alert: 'Invalid or expired login link'
    end
  end

  def destroy
    self.current_user = nil
    redirect_to root_path, notice: 'Sucesfully signed-out'
  end
end
