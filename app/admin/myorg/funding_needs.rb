ActiveAdmin.register FundingNeed, namespace: :myorg do
  permit_params :name, :description, :website, :image_url, :organization_id

  config.filters = false

  scope_to do
    current_organization_user
  end

  form do |f|
    f.inputs 'Program' do
      f.input :organization
      f.input :name
      f.input :description
      f.input :website
      f.input :image_url
    end
    f.actions
  end

  # controller do
  #   def create
  #
  #   end
  # end
end