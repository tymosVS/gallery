class AddCounterFansCouterCommentsToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :comments_count, :integer
    add_column :images, :fans_count, :integer
  end
end
