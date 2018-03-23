class CreateInterests < ActiveRecord::Migration[5.0]
  def change
    create_table :interests do |t|
      t.string :name
      t.string :external_id
      t.string :category
      t.string :subcategory
      t.string :description

      t.timestamps
    end
  end
end
