class AddFollowersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :followships do |t|
      t.integer :user_id, null: false, unique: true
      t.integer :follower_id, null: false, unique: true
      t.timestamps
    end
  end
end
