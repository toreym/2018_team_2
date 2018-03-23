class AddRaisedToFundingNeed < ActiveRecord::Migration[5.0]
  def change
    add_column :funding_needs, :raised, :integer
  end
end
