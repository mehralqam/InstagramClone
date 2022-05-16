class AddRequestToUser < ActiveRecord::Migration[5.2]
  def change
      create_table :followrequests do |t|
      t.string :follow_user_id, null: false
      t.string :follow_user_name
      t.integer :request_status, default: 0
      t.timestamps null: false
      t.string :user_id, null: false
      t.string :user_name
      end
  end
end
