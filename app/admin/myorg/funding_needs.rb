ActiveAdmin.register FundingNeed, namespace: :myorg do
  permit_params :name, :description, :website, :image_url

  config.filters = false

  scope_to association_method: :funding_needs do
    current_organization
  end

  form do |f|
    f.inputs 'Program' do
      f.input :name
      f.input :description
      f.input :website
      f.input :image_url
    end
    f.actions
  end
end