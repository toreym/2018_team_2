class AddLoginTokenToDonors < ActiveRecord::Migration[5.0]
  def change
    add_column :donors, :login_token, :string
    add_column :donors, :login_token_expires, :datetime
  end
end
