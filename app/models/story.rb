# frozen_string_literal: true

class Story < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  paginates_per 1
end
