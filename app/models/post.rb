# frozen_string_literal: true

class Post < ApplicationRecord
  validates_presence_of :images
  has_many_attached :images

  belongs_to :user

  has_many :comments, dependent: :destroy

end
