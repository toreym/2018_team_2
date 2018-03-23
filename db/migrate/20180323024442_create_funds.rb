class CreateFunds < ActiveRecord::Migration[5.0]
  def change
    create_table :funds do |t|
      t.string :name
      t.string :external_id

      t.timestamps
    end
  end
end
