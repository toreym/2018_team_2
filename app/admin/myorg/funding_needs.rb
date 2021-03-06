ActiveAdmin.register FundingNeed, namespace: :myorg do
  permit_params :name, :description, :website, :image_url, :organization_id, :image, :end_date, :goal,
                :primary_contact_name, :primary_contact_email, :primary_contact_phone, interest_ids: []

  config.filters = false

  scope_to do
    current_organization_user
  end

  form do |f|
    f.inputs 'Funding Need' do
      if current_organization_user.organizations.count > 1
        f.input :organization, :label => 'Organization', :as => :select, :collection => current_organization_user.organizations.map{|o| [o.name, o.id]}, include_blank: false
      else
        f.input :organization_id, :as => :hidden, input_html: {:value => current_organization_user.organizations.first.id}
      end

      f.input :name
      f.input :end_date
      f.input :description, hint: "No more than 50 words. A shorter description performs better!", :input_html => {:rows => 2, :cols => 50}
      f.input :website
      f.input :image
      f.input :goal
      f.input :primary_contact_name
      f.input :primary_contact_email
      f.input :primary_contact_phone
      f.input :interests, :as => :check_boxes, :collection => Interest.order(name: :asc).all.map{|o| [o.name, o.id]}, :label => 'Interest'

    end
    f.actions
  end

  index do
    column :approved
    column :name
    column :organization
    column :end_date
    column :raised
    column :goal
    column :primary_contact_name
    actions
  end

  # This is what Celia had to say ---> e

end