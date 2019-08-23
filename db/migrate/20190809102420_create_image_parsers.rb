# frozen_string_literal: true

class CreateImageParsers < ActiveRecord::Migration[5.2]
  def change
    create_table :image_parsers do |t|
      t.timestamps
    end
  end
end
