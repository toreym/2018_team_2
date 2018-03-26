ActiveAdmin.register Organization do
  permit_params :name, :ein, :organization_user_id, :image

  form do |f|
    f.inputs 'Organization' do
      f.input :name
      f.input :ein
      f.input :organization_user, :label => 'Organization User', :as => :select, :collection => OrganizationUser.all, include_blank: false
      f.input :image
    end
    f.actions
  end

  show do
    attributes_table do
      rows :name, :ein
      row "ID" do |d|
        d.external_id
      end
    end
  end

  index do
    column :name
    column "ID" do |d|
      d.external_id
    end
    column :ein
    column :organization_user
    actions
  end
end
