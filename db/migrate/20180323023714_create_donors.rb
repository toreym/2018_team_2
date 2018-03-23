class CreateDonors < ActiveRecord::Migration[5.0]
  def change
    create_table :donors do |t|
      t.string :name
      t.integer :fund_id
      t.integer :external_id
      t.integer :external_fund_id

      t.timestamps
    end
  end
end
