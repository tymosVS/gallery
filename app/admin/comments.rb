ActiveAdmin.register Comment, :as => "User Comments" do
  permit_params :body, :image_id, :user_id
  filter:user
  filter:image
  filter:created_at
  filter :user_name, as: :string
end
