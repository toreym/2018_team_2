ActiveAdmin.register AppSetting do
  permit_params :setting, :value, :description
end