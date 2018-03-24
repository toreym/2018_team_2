ActiveAdmin.register FundingNeed do
  permit_params :name, :organization_id, :description, :website, :goal, :end_date, :image_url, :primary_contact_name,
                :primary_contact_email, :primary_contact_phone, :approved, :image, interest_ids: []

  form do |f|
    f.inputs 'FundingNeed' do
      f.input :approved
      f.input :name
      f.input :organization, include_blank: false
      f.input :description
      f.input :website
      f.input :goal
      f.input :end_date
      f.input :primary_contact_name
      f.input :primary_contact_email
      f.input :primary_contact_phone
      f.input :interests, hint: "Hold CTRL and click (CMD on the Mac) to select more than one item."
      f.input :image
    end
    f.actions
  end

  show do
    attributes_table do
      row "Image" do |f|
        image_tag(f.image.url(:thumb))
      end
      rows :name, :organization, :approved, :primary_contact_email, :primary_contact_name, :primary_contact_phone, :description, :interests
    end
  end

  index do
    column :approved
    column :name
    column :organization
    column :primary_contact_name
    column :primary_contact_email
    column :primary_contact_phone
    column :end_date
    column :interests
    actions
  end

    filter :approved
    filter :name
    filter :organization
    filter :primary_contact_email
    filter :interests
    filter :end_date
end
