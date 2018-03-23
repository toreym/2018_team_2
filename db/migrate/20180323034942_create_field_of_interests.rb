class CreateFieldOfInterests < ActiveRecord::Migration[5.0]
  def change
    create_table :field_of_interests do |t|
      t.string :name
      t.string :type
      t.string :category
      t.string :subcategory
      t.string :description

      t.timestamps
    end
  end
end
