class ChangeColumnsOnFieldOfInterest < ActiveRecord::Migration[5.0]
  def change
    remove_column :field_of_interests, :name, :string
    remove_column :field_of_interests, :category, :string
    remove_column :field_of_interests, :subcategory, :string
    remove_column :field_of_interests, :description, :string
    add_column :field_of_interests, :interest_id, :integer, :after => :id
    add_column :field_of_interests, :liked, :boolean, :after => :type
  end
end
