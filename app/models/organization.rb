class Organization < ApplicationRecord
  has_many :funding_needs
  has_many :distributions

  belongs_to :organization_user

  def self.import_row(header, row)
    {
        :name => header
    }
    Rails.logger.debug
    name = row[header.find_index("Organization Legal Name")] if header.find_index("Organization Legal Name")
    external_id = row[header.find_index("Party ID")] if header.find_index("Party ID")
    ein = row[header.find_index("Tax ID")] if header.find_index("Tax ID")
    email = row[header.find_index("Email")] if header.find_index("Email")
    #TODO: map row based on header columns and attrs of organization
    return if external_id.nil?
    organization = Organization.find_by(:external_id => external_id)

    if organization
      organization.update_attributes(:email => email, :ein => ein, :name => name)
    else
      Organization.create(:email => email, :ein => ein, :name => name, :external_id => external_id, :password => SecureRandom.base64)
    end
  end
end
