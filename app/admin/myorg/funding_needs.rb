ActiveAdmin.register FundingNeed, namespace: :myorg do
  permit_params :name, :description, :website, :image_url, :organization_id, :image, :end_date

  config.filters = false

  scope_to do
    current_organization_user
  end

  form do |f|
    f.inputs 'Funding Need' do
      if current_organization_user.organizations.count > 1
        f.input :organization, :label => 'Organization', :as => :select, :collection => current_organization_user.organizations.map{|o| [o.name, o.id]}
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
      f.input :interests, hint: "Hold CTRL and click (CMD on the Mac) to select more than one item."
    end
    f.actions
  end

  # controller do
  #   def create
  #
  #   end
  # end
end