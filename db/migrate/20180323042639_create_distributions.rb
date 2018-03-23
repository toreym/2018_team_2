class CreateDistributions < ActiveRecord::Migration[5.0]
  def change
    create_table :distributions do |t|
      t.integer :external_id
      t.integer :external_fund_id
      t.integer :external_organization_id
      t.integer :fund_id
      t.id :organization_id
      t.integer :amount
      t.date :effective_date

      t.timestamps
    end
  end
end
