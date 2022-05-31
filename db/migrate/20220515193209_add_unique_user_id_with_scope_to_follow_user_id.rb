# frozen_string_literal: true

class AddUniqueUserIdWithScopeToFollowUserId < ActiveRecord::Migration[5.2]
  def change
    add_index :follow_requests, %i[follow_user_id user_id], unique: true
  end
end
