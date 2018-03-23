class AddContactDetailToOrganizationAndFundingNeed < ActiveRecord::Migration[5.0]
  def change
    add_column :organizations, :website, :string
    add_column :funding_needs, :primary_contact_name, :string
    add_column :funding_needs, :primary_contact_email, :string
    add_column :funding_needs, :primary_contact_phone, :string
  end
end
