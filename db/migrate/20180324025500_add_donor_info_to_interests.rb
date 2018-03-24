class AddDonorInfoToInterests < ActiveRecord::Migration[5.0]
  def change
    add_column :field_of_interests, :donor_id, :integer
    add_column :field_of_interests, :organization_id, :integer
  end
end
