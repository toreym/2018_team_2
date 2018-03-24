class Donor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable

  has_many :field_of_interests
  has_and_belongs_to_many :funds, :join_table => :donor_fund_relations

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

  def self.where_not_valid_fund_upload(header)
    !(header.find_index("Name") &&	header.find_index("Party ID") && header.find_index("Account ID")	&& header.find_index("Login ID"))
  end

  def self.import_row(header, row)
    if where_not_valid_fund_upload(header)
      raise ArgumentError.new('Invalid data for this Fund upload type.')
    end

    name = row[header.find_index("Name")] if header.find_index("Name")
    external_id = row[header.find_index("Party ID")] if header.find_index("Party ID")
    external_fund_id = row[header.find_index("Account ID")] if header.find_index("Account ID")
    email = row[header.find_index("Login ID")] if header.find_index("Login ID")

    fund = Fund.find_by(:external_id => external_fund_id)
    donor = Donor.find_by(:external_id => external_id)

    if donor
      donor_fund_rel = DonorFundRelation.find_by(:external_fund_id => external_fund_id)
      unless donor_fund_rel
        DonorFundRelation.create(:external_fund_id => external_fund_id, :donor_id => donor.id, :fund_id => fund.id) if fund
      end
      donor.update_attributes({:email => email, :name => name})
    else
      donor = {:email => email, :name => name, :external_id => external_id}
      @new_donor = Donor.create(donor)
      DonorFundRelation.create(:external_fund_id => external_fund_id, :donor_id => @new_donor.id, :fund_id => fund.id) if fund
    end
  end
end
