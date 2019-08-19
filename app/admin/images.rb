ActiveAdmin.register Image do

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
  permit_params :id, :image, :title

  index do
    selectable_column 
    column :id
    column :title
    column :image do |image|
      link_to(image_tag(image.image.small_thumb.url, alt: "Some image", title: image.title), 
      admin_image_path(image)) unless image[:image].nil?
    end
    column :created_at
    actions
  end

  index as: :grid, default: true do |image|
    
    div do
      link_to image_tag(image.image.small_thumb.url), admin_image_path(image)
    end
    div do
      image.title
    end
  end

  filter :fans
  filter :created_at
  filter :containing_category_in, 
    as: :select, 
    label: 'Category',
    collection: Category.all

end
