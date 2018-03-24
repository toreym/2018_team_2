ActiveAdmin.register FundingNeed do
  permit_params :name, :organization_id, :description, :website, :goal, :end_date, :image_url, :primary_contact_name,
                :primary_contact_email, :primary_contact_phone, :approved, :image, interest_ids: []

  form do |f|
    f.inputs 'FundingNeed' do
      f.input :approved
      f.input :name
      f.input :organization, :label => 'Organization', :as => :select, :collection => Organization.order(name: :asc).all.map{|o| [o.name, o.id]}, include_blank: false
      f.input :description
      f.input :website
      f.input :goal
      f.input :end_date
      f.input :raised
      f.input :primary_contact_name
      f.input :primary_contact_email
      f.input :primary_contact_phone
      f.input :interests, :as => :check_boxes, :collection => Interest.order(name: :asc).all.map{|o| [o.name, o.id]}, :label => 'Interest'
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
    column :end_date
    column :description
    column :website
    column :raised
    column :goal
    column :primary_contact_name
    column :primary_contact_email
    column :primary_contact_phone
    column :interests
    column :created_at
    column :updated_at
    actions
  end

    filter :approved
    filter :name
    filter :organization
    filter :primary_contact_email
    filter :interests
    filter :end_date
end
