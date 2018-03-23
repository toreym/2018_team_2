ActiveAdmin.register Interest do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
#
  permit_params :name, :external_id, :category, :subcategory, :description

  form do |f|
    f.inputs 'Interest' do
      f.input :name
      f.input :external_id
      f.input :category
      f.input :subcategory
      f.input :description
    end
    f.actions
  end

  controller do

    def create

      @interest = Interest.new(permitted_params[:interest])

      if @interest.save
        redirect_to admin_interest_path(@interest)
      else
        render :new
      end
    end
  end



end
