class CreateAppSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :app_settings do |t|
      t.string :setting
      t.string :value
      t.string :description

      t.timestamps
    end
  end
end
