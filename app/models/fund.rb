class Fund < ApplicationRecord

  has_many :donors
  has_many :distributions
  has_and_belongs_to_many :donor_fund_relations
end
