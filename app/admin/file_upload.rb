ActiveAdmin.register FileUpload do
  permit_params :file, :upload_type

  form do |f|
    f.inputs 'FileUpload' do
      f.input :file, as: :file
      f.input :upload_type, :label => 'Import Type', :as => :select, :collection => FileUpload.available_types.map{|u| ["#{u.name}", "#{u.name}"]}, :selected => FileUpload.available_types.first.name
    end
    f.actions
  end

  show do
    attributes_table do
      rows :upload_type, :created_at, :status
    end
  end

  index do
    column :upload_type
    column :created_at
    column :status
    actions
  end

  controller do

    def create
      attrs = permitted_params[:file_upload]

      @file_upload = FileUpload.new

      @file_upload[:file_name] = attrs[:file].original_filename
      @file_upload[:file] = attrs[:file].read
      @file_upload[:upload_type] = attrs[:upload_type]

      if @file_upload.save
        begin
          @file_upload.import
        rescue ArgumentError => e
          @file_upload.update_attributes(status:"Error")
          redirect_to(admin_file_upload_path(@file_upload), alert: e.message) and return
        end

        @file_upload.update_attributes(status:"Success")
        redirect_to admin_file_upload_path(@file_upload)
      else
        render :new
      end
    end

    def update
      attrs = permitted_params[:file]

      @file_upload = FileUpload.find_by(id: params[:id])

      @file_upload[:file_file_name] = attrs[:file].original_filename
      @file_upload[:file] = attrs[:file].read
      @file_upload[:upload_type] = attrs[:upload_type]

      if @file_upload.save
        redirect_to admin_firmware_image_path(@file_upload)
      else
        render :edit
      end
    end
  end
end
