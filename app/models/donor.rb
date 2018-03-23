class Donor < FileUpload
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :fund
  has_many :field_of_interests

  def new_login_token
    # get a new token. make sure to check for existing tokens.
    (1..50).each do
      tk = SecureRandom.urlsafe_base64(64)
      if Donor.find_by(login_token: tk).nil?
        self.login_token = tk
        break
      end
    end

    expire = AppSetting.get_setting('login link expiration', default: 7)

    self.login_token_expires = expire.days.from_now
    self.login_token
    self.save
  end

end
