ActiveAdmin.register Post do
  permit_params :category_id, :image_id, :id, :created_at, :updated_at
  filter :category
  filter :created_at
  filter :updated_at
end
