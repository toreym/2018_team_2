class AddHasManyRelationInterestFundingNeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :funding_needs_interests do |t|
      t.belongs_to :funding_need, index: true
      t.belongs_to :interest, index: true

      t.timestamps
    end
  end
end
