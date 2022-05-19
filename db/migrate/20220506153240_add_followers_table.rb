# frozen_string_literal: true

class AddFollowersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :followships do |t|
      t.integer :user_id, null: false
      t.integer :follower_id, null: false
      t.timestamps
    end
  end
end
