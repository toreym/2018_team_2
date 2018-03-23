class FundingNeed < FileUpload
  belongs_to :organization
  has_many :field_of_interests
end
