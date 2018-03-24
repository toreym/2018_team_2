class FundingNeed < ApplicationRecord
  belongs_to :organization
  has_many :field_of_interests

  validates_presence_of :end_date

  #test
end