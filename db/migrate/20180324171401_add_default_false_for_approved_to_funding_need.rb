class AddDefaultFalseForApprovedToFundingNeed < ActiveRecord::Migration[5.0]
  def change
    change_column :funding_needs, :approved, :boolean, :default => false
  end
end
