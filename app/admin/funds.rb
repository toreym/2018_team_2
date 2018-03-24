ActiveAdmin.register Fund do
  permit_params :name, :external_id, :spendable_balance
end
