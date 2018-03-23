class AddApprovedToFundingNeed < ActiveRecord::Migration[5.0]
  def change
    add_column :funding_needs, :approved, :boolean
  end
end
