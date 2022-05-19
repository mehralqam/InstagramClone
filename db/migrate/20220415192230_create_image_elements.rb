# frozen_string_literal: true

class CreateImageElements < ActiveRecord::Migration[5.2]
  def change
    create_table :image_elements do |t|
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
