ActiveAdmin.register User do
  
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
