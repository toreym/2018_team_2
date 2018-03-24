ActiveAdmin.register FundingNeed, namespace: :myorg do
  permit_params :name, :description, :website, :image_url, :organization_id, :image, :end_date

  config.filters = false

  scope_to do
    current_organization_user
  end

  form do |f|
    f.inputs 'Funding Need' do
      f.input :organization
      f.input :name
      f.input :end_date
      f.input :description, hint: "No more than 50 words. A shorter description performs better!", :input_html => {:rows => 2, :cols => 50}
      f.input :website
      f.input :image
    end
    f.actions
  end

  # controller do
  #   def create
  #
  #   end
  # end
end