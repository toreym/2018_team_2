ActiveAdmin.register FundingNeed do
  permit_params :name, :organization_id, :description, :website, :goal, :end_date, :image_url, :primary_contact_name,
                :primary_contact_email, :primary_contact_phone, :approved, :image

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
      f.input :image
    end
    f.actions
  end

end
