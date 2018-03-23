class ChangeColumnTypeNameOnFileUpload < ActiveRecord::Migration[5.0]
  def change
     rename_column :file_uploads, :type, :upload_type
  end
end
