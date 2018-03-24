class Interest < ApplicationRecord
  has_and_belongs_to_many :funding_needs, :join_table => :funding_needs_interests
end
