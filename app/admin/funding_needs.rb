ActiveAdmin.register FundingNeed do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  permit_params :name, :organization_id, :description, :website, :goal, :end_date, :image_url, :primary_contact_name, :primary_contact_email, :primary_contact_phone, :approved

  form do |f|
    f.inputs 'FundingNeed' do
      f.input :name
      f.input :organization_id
      f.input :description
      f.input :website
      f.input :goal
      f.input :end_date
      f.input :image_url, as: :file
      f.input :primary_contact_name
      f.input :primary_contact_email
      f.input :primary_contact_phone
      f.input :approved
    end
    f.actions
  end

  controller do
    def create
      attrs = permitted_params[:funding_need]

      image = attrs[:image_url]

      @funding_need = FundingNeed.new
      dirname = Rails.root.join('public', 'images').to_s
      FileUtils.mkdir_p dirname
      ext = Rack::Mime::MIME_TYPES.invert[image.content_type]
      new_file_path = Rails.root.join('public', 'images', SecureRandom.uuid + ext)
      FileUtils.mv image.path(), new_file_path

      @funding_need[:name] = attrs[:name]
      @funding_need[:organization_id] = attrs[:organization_id]
      @funding_need[:description] = attrs[:description]
      @funding_need[:website] = attrs[:website]
      @funding_need[:goal] = attrs[:goal]
      @funding_need[:end_date] = attrs[:end_date]
      @funding_need[:image_url] = new_file_path
      @funding_need[:primary_contact_name] = attrs[:primary_contact_name]
      @funding_need[:primary_contact_email] = attrs[:primary_contact_email]
      @funding_need[:primary_contact_phone] = attrs[:primary_contact_phone]
      @funding_need[:approved] = attrs[:approved]

      @funding_need.save
      render :list
    end

    def update
      attrs = permitted_params[:funding_need]

      image = attrs[:image_url]

      @funding_need = FundingNeed.find_by(id: params[:id])
      dirname = Rails.root.join('public', 'images').to_s
      FileUtils.mkdir_p dirname
      ext = Rack::Mime::MIME_TYPES.invert[image.content_type]
      new_file_path = Rails.root.join('public', 'images', SecureRandom.uuid + ext)
      FileUtils.mv image.path(), new_file_path

      @funding_need[:name] = attrs[:name]
      @funding_need[:organization_id] = attrs[:organization_id]
      @funding_need[:description] = attrs[:description]
      @funding_need[:website] = attrs[:website]
      @funding_need[:goal] = attrs[:goal]
      @funding_need[:end_date] = attrs[:end_date]
      @funding_need[:image_url] = new_file_path
      @funding_need[:primary_contact_name] = attrs[:primary_contact_name]
      @funding_need[:primary_contact_email] = attrs[:primary_contact_email]
      @funding_need[:primary_contact_phone] = attrs[:primary_contact_phone]
      @funding_need[:approved] = attrs[:approved]

      @funding_need.save
      render :edit
    end
  end
end
