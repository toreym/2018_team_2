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
      redirect_to root_path, notice: 'Signed in successfully!'
    else
      redirect_to root_path, notice: 'Invalid or expired login link.'
    end
  end

  def destroy
    self.current_donor = nil
    redirect_to root_path, notice: 'Successfully logged out'
  end

  def request_new_session
    # make sure the email address exists
    @donor = Donor.find_by email: params[:email]
    if @donor
      @donor.new_login_token

      # send them an email with the new link
      DonorRequestSessionMailer.request_session(@donor).deliver_now

      redirect_to root_path, notice: "Please check your email. We've sent you a link to log in."
    else
      redirect_to root_path, notice: "We do not see an account for you. Please contact us to register as a donor."
    end
  end
end
