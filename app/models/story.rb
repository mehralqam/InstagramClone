# frozen_string_literal: true

class Story < ApplicationRecord
  scope :old, -> { where('created_at <= ?', 24.hours.ago) }
  has_one_attached :image
  belongs_to :user
  paginates_per 1
end
