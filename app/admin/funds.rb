ActiveAdmin.register Fund do
  permit_params :name, :external_id, :spendable_balance

  form do |f|
    f.inputs 'Fund' do
      f.input :name
      f.input :external_id
      f.input :spendable_balance
    end
    f.actions
  end
end
