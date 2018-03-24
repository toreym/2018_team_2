class RemoveUniqueIndexFromOrganizations < ActiveRecord::Migration[5.0]
  def change
    remove_index :organizations, :email
  end
end
