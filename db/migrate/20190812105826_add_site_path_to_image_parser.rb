class AddSitePathToImageParser < ActiveRecord::Migration[5.2]
  def change
    add_column :image_parsers, :site_path, :string
  end
end
