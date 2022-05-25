# frozen_string_literal: true

class AddRequestToUser < ActiveRecord::Migration[5.2]
  def change
    create_table :follow_requests do |t|
      t.string :follow_user_id, null: false
      t.timestamps null: false
      t.string :user_id, null: false
    end
  end
end
