class CreateImageParsers < ActiveRecord::Migration[5.2]
  def change
    create_table :image_parsers do |t|
      t.string :site_path
      t.references :images, foreign_key: true

      t.timestamps
    end
  end
end
