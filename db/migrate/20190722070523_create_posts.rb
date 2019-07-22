class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :category, foreign_key: true
      t.references :image, foreign_key: true

      t.timestamps
    end
  end
end
