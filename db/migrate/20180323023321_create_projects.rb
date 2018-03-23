class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :organization_id

      t.timestamps
    end
  end
end
