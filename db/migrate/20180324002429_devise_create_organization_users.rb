# frozen_string_literal: true

class DeviseCreateOrganizationUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :organization_users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :name
      t.string :external_id

      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      t.timestamps null: false
    end

    add_index :organization_users, :email,                unique: true
    add_index :organization_users, :reset_password_token, unique: true

    add_column :organizations, :organization_user_id, :integer
  end
end
