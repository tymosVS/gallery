class AddImageUrlToImageParsers < ActiveRecord::Migration[5.2]
  def change
    add_column :image_parsers, :image_url, :string
  end
end
