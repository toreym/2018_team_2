ActiveAdmin.register Organization, namespace: :myorg do
  permit_params :name, :website, :ein, :organization_user_id

  menu :label => "My Orgs", :priority => 1

  form do |f|
    f.inputs 'Organization' do
      f.input :name
      f.input :ein
      f.input :website
      f.input :organization_user
      f.input :image
    end
    f.actions
  end
end