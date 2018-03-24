class Organization < ApplicationRecord
  has_many :funding_needs
  has_many :distributions

  belongs_to :organization_user

  has_attached_file :image,
                    {styles: { medium: "300x300>", thumb: "100x100>" },
                    default_url: "/images/:style/missing.png",
                    :storage => :s3,
                    :s3_credentials => {:bucket => ENV['S3_CDN_BUCKET'], :access_key_id => ENV['S3_CDN_KEY_ID'], :secret_access_key => ENV['S3_CDN_SECRET'], s3_region: ENV['AWS_REGION']}}

  validates_attachment_content_type :image, :content_type => /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/, :message => 'file type is not allowed (only jpeg/png/gif images)'
  
  def self.where_not_valid_organization_upload(header)
    return !(header.find_index("Organization Legal Name") &&
             header.find_index("Party ID") &&
             header.find_index("Tax ID") &&
             header.find_index("Email"))
  end
  
  def self.import_row(header, row)
    if where_not_valid_organization_upload(header)
      raise ArgumentError.new('Invalid data for this Organization upload type.')
    end

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
