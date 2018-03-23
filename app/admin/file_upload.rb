ActiveAdmin.register FileUpload do
  permit_params :file, :type

  form do |f|
    f.inputs 'FileUpload' do
      f.input :file, as: :file
      f.input :type, :label => 'Import Type', :as => :select, :collection => FileUpload.available_types.map{|u| ["#{u.name}", "#{u.name}"]}, :selected => FileUpload.available_types.first.name
    end
    f.actions
  end

  controller do

    def create
      attrs = permitted_params[:file_upload]

      @file_upload = FileUpload.new

      @file_upload[:file_name] = attrs[:file].original_filename
      @file_upload[:file] = attrs[:file].read
      @file_upload[:type] = attrs[:type]

      if @file_upload.save
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
      @file_upload[:type] = attrs[:type]

      if @file_upload.save
        redirect_to admin_firmware_image_path(@file_upload)
      else
        render :edit
      end
    end
  end
end
