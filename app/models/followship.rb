# frozen_string_literal: true

class Followship < ApplicationRecord
  validates :follower, uniqueness: true
  belongs_to :user
  belongs_to :follower, :class_name => "User"

  scope :user_specific_followers, ->(current_user) { where('follower_id = ?', current_user) }
end
