class DonorRequestSessionMailer < ApplicationMailer
  default from: 'jones@desmoinesfoundation.org'

  def request_session(donor)
    @donor = donor
    mail(to: @donor.email, subject: 'Your GIVEdsm Login link!')
  end
end
