class FundingNeed < ApplicationRecord
  belongs_to :organization
  has_and_belongs_to_many :interests, :join_table => :funding_needs_interests

  validates_presence_of :end_date

  has_attached_file :image,
                    {styles: { medium: "300x300>", thumb: "100x100>" },
                    default_url: "/images/:style/missing.png",
                    :storage => :s3,
                    :s3_credentials => {:bucket => ENV['S3_CDN_BUCKET'], :access_key_id => ENV['S3_CDN_KEY_ID'], :secret_access_key => ENV['S3_CDN_SECRET'], s3_region: ENV['AWS_REGION']}}

  validates_attachment_content_type :image, :content_type => /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/, :message => 'file type is not allowed (only jpeg/png/gif images)'
end