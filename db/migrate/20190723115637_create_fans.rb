# frozen_string_literal: true

class CreateFans < ActiveRecord::Migration[5.2]
  def change
    create_table :fans do |t|
      t.references :user, foreign_key: true
      t.references :image, foreign_key: true

      t.timestamps
    end
  end
end
