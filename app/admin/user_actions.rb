ActiveAdmin.register UserAction,:as => "UserActions" do
  filter :action
  filter :user,
    as: :select, 
    label: 'User email',
    collection: User.all.pluck(:email)

  index do
    selectable_column
    column :id
    column :user
    column :action
    column :action_path
    column :created_at
    actions
  end
end
