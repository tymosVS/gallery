ActiveAdmin.register UserAction,:as => "UserActions" do

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
  # index do
  #   column :id
  #   column :user_id
  #   # column User_email
  #   column :email
  #   column :action
  #   column :action_path
  # end
  filter :action
  filter :user
  
end