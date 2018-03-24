class UpdateDescriptionLength < ActiveRecord::Migration[5.0]
  def change
    change_column :funding_needs, :description, :text
  end
end
