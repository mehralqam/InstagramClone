# frozen_string_literal: true

class User < ApplicationRecord
  include PgSearch::Model
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_one_attached :avatar

  has_many :followships
  has_many :followers , through: :followships
  has_many :inverse_followships, class_name: "Followship",foreign_key: "follower_id"
  has_many :inverse_followers, through: :inverse_followships, source: :user
  has_many :posts, dependent: :destroy
  has_many :stories, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :followrequests, dependent: :destroy

  pg_search_scope :search_users, against: :user_name

  scope :can_follow_users, ->(current_user) { where('id != ?', current_user).where("account_type = 'public'") }
  scope :follow_request, -> (current_user) { where('id != ?', current_user).where("account_type = 'private'") }
end
