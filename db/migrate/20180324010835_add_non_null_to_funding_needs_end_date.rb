class AddNonNullToFundingNeedsEndDate < ActiveRecord::Migration[5.0]
  def change
    change_column :funding_needs, :end_date, :date, null: false
  end
end
