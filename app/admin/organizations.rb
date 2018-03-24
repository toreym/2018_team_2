ActiveAdmin.register Organization do
  permit_params :name, :organization_user_id

  form do |f|
    f.inputs 'Organization' do
      f.input :name
      f.input :ein
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
    actions
  end
end