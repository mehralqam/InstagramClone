# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_one_attached :avatar

  has_many :followships
  has_many :followers , :through => :followships
  has_many :inverse_followers, :class_name => "Followers", :foreign_key => "follower_id"
  has_many :inverse_friends, :through => :inverse_follolwings, :source => :user
  has_many :posts, dependent: :destroy
  has_many :stories, dependent: :destroy
  has_many :comments, dependent: :destroy

  # ThinkingSphinx::Callbacks.append(self, :behaviours => [:real_time])



end
