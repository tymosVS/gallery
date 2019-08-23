# frozen_string_literal: true

class AddActionLinkToUserActions < ActiveRecord::Migration[5.2]
  def change
    add_column :user_actions, :action_path, :string
  end
end
