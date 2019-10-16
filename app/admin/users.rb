ActiveAdmin.register User do

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
  # end
  permit_params :id, :name, :email, :confirmed_at, :avatar, :password
  form title: 'Create user' do |f|
    inputs 'Details' do
      input :name
      input :email
      input :avatar
      input :password
      input :confirmed_at
      actions
    end
  end
  index do
    selectable_column
    column :id
    column :name
    column :email
    column :confirmed_at
    column :avatar
    actions
  end
  filter :name_equals
  filter :creators
end
