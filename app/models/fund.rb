class Fund < ApplicationRecord

  has_many :donors
  has_many :distributions
end
