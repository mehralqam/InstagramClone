# frozen_string_literal: true

class User < ApplicationRecord
  include PgSearch::Model
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_one_attached :avatar

  has_many :followships, dependent: :destroy
  has_many :followers, through: :followships
  has_many :inverse_followships, class_name: :Followship, foreign_key:
  :follower_id, dependent: :destroy, inverse_of: 'user'
  has_many :inverse_followers, through: :inverse_followships, source: :user
  has_many :posts, dependent: :destroy
  has_many :stories, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :follow_requests, dependent: :destroy
  has_many :likes, dependent: :destroy

  scope :open_account_users, ->(user) { where.not(id: user).open }
  scope :private_account_users, ->(user) { where.not(id: user).closed }
  scope :other_users, ->(user) { where.not(id: user.id) }

  enum account_type: {
    open: 0,
    closed: 1
  }

  pg_search_scope(
    :search_users,
    against: {
      user_name: 'A'
    },
    using: {
      tsearch: { prefix: true, any_word: true, dictionary: 'english' }
    }
  )
end
