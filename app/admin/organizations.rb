ActiveAdmin.register Organization do
  permit_params :name, :email, :ein, :password, :password_confirmation

  form do |f|
    f.inputs 'Organization' do
      f.input :name
      f.input :ein
      f.input :email
      if f.object.new_record?
        f.input :password
        f.input :password_confirmation
      end
    end
    f.actions
  end

  member_action :reset_password, :method => :patch do
    org = Organization.find_by(id: params[:id])
    if org
      password_secure = Passgen::generate(:length => 14)
      org.password = password_secure
      org.password_confirmation = password_secure
      flash[:notice] = "Password changed to #{password_secure}" if org.save
    end
    redirect_to admin_organization_path(params[:id])
  end

  # member_action :log_in_as do
  #   org = Organization.find_by(id: params[:id])
  #   if org
  #     sign_in_and_redirect(:organization, org, { :bypass => true })
  #   else
  #     redirect_to admin_donor_path(params[:id])
  #   end
  # end

  action_item :reset_password, only: :show do
    link_to 'Reset password', reset_password_admin_organization_path(resource), method: :patch
  end

  show do
    attributes_table do
      rows :name, :email, :ein
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
    column :ein
    actions
  end
end