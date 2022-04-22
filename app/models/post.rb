# frozen_string_literal: true

class Post < ApplicationRecord
  has_many_attached :images
  belongs_to :user
  has_many :stories
end
