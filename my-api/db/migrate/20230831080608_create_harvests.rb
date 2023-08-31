# frozen_string_literal: true

class CreateHarvests < ActiveRecord::Migration[7.0]
  def change
    create_table :harvests do |t|
      t.datetime :date
      t.float :weight
      t.references :hive, null: false, foreign_key: true

      t.timestamps
    end
  end
end
