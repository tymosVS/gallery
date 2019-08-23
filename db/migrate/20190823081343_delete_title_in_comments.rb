# frozen_string_literal: true

class DeleteTitleInComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :title
  end
end
