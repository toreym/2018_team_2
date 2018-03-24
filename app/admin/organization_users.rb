ActiveAdmin.register OrganizationUser do
  permit_params :name, :email, :password, :password_confirmation

  form do |f|
    f.inputs 'Organization User' do
      f.input :name
      f.input :email
      if f.object.new_record?
        f.input :password
        f.input :password_confirmation
      end
    end
    f.actions
  end

  member_action :reset_password, :method => :patch do
    org = OrganizationUser.find_by(id: params[:id])
    if org
      password_secure = Passgen::generate(:length => 14)
      org.password = password_secure
      org.password_confirmation = password_secure
      flash[:notice] = "Password changed to #{password_secure}" if org.save
    end
    redirect_to admin_organization_user_path(params[:id])
  end

  action_item :reset_password, only: :show do
    link_to 'Reset password', reset_password_admin_organization_user_path(resource), method: :patch
  end

  show do
    attributes_table do
      rows :name, :email
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
    column :email
    actions
  end
end