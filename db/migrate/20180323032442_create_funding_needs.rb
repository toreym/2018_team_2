class CreateFundingNeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :funding_needs do |t|
      t.string :name
      t.integer :organization_id
      t.string :description
      t.string :website
      t.integer :goal
      t.date :end_date
      t.string :image_url

      t.timestamps
    end
  end
end
