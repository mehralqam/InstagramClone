# frozen_string_literal: true

class Followship < ApplicationRecord
  validates :follower, uniqueness: true
  belongs_to :user
  belongs_to :follower, :class_name => "User"
end
