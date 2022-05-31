# frozen_string_literal: true

class AddNameUser < ActiveRecord::Migration[5.2]
  def change
    change_table :users, bulk: true do |t|
      t.string :name, null: false, unique: true, default: ''
      t.integer :account_type, null: false, unique: true, default: 0
    end
  end
end
