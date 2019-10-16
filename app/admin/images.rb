ActiveAdmin.register Image do
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
