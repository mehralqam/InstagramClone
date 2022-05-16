# frozen_string_literal: true

class AddNameUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, null: false, unique: true
    add_column :users, :account_type, :string, null: false
  end
end
