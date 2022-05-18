# frozen_string_literal: true

class Post < ApplicationRecord
  validates :images, presence: true
  has_many_attached :images

  belongs_to :user

  has_many :comments, dependent: :destroy

  validate :image_limit

  def image_limit
    errors.add(:images , " can't be over 10") if images.length > 2
  end
end
