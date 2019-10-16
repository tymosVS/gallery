# frozen_string_literal: true

ActiveAdmin.register Category do
  permit_params :title, :description, :id, :slug, :posts_count
  filter :creator
  filter :created_at
end
