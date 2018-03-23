class CreateFileUploads < ActiveRecord::Migration[5.0]
  def change
    create_table :file_uploads do |t|
      t.string :file_name
      t.string :type
      t.text :file, :limit => 100.megabytes
      t.string :status

      t.timestamps
    end
  end
end
