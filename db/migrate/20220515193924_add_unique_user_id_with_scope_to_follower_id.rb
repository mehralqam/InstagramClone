class AddUniqueUserIdWithScopeToFollowerId < ActiveRecord::Migration[5.2]
  def change
    add_index :followships, %i[follower_id user_id], unique: true
  end
end
