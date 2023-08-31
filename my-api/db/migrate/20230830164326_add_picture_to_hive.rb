# frozen_string_literal: true

class AddPictureToHive < ActiveRecord::Migration[7.0]
  def change
    add_column :hives, :picture, :string
  end
end
