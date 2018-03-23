class Fund < FileUpload

  has_many :donors
  has_many :distributions
end
