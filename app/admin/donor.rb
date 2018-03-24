ActiveAdmin.register Donor do
  permit_params :name, :email, fund_ids: []

  form do |f|
    f.inputs 'Donor' do
      f.input :name
      f.input :email
      f.input :funds, hint: "Hold CTRL and click to select more than one item."
    end
    f.actions
  end

  member_action :new_login_link, :method => :patch do
    donor = Donor.find_by(id: params[:id])
    donor.new_login_token if donor
    redirect_to admin_donor_path(params[:id])
  end

  member_action :log_in_as do
    donor = Donor.find_by(id: params[:id])
    #sign_in_and_redirect(:user, user, { :bypass => true })
    #redirect_to admin_donor_path(params[:id])
  end

  action_item :new_magic_link, only: :show do
    link_to 'New login link', new_login_link_admin_donor_path(resource), method: :patch
  end

  show do
    attributes_table do
      rows :name, :email
      row "ID" do |d|
        d.external_id
      end
      row "Magic login link" do |d|
        if d.login_token and d.login_token_expires > DateTime.now
          link_to donor_login_url(d.login_token), donor_login_url(d.login_token), target: "_blank", rel: "nofollow"
        else
          ""
        end
      end
      row "Magic link expires" do |d|
        if d.login_token and d.login_token_expires > DateTime.now
          d.login_token_expires
        else
          ""
        end
      end
      row :funds
    end
  end

  index do
    column :name
    column "ID" do |d|
      d.external_id
    end
    column :email

    actions :defaults => true do |donor|
      link_to "Sign in", log_in_as_admin_donor_path(donor)
    end
  end
end