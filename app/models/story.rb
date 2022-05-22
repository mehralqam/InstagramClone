# frozen_string_literal: true

class Story < ApplicationRecord
  has_one_attached :image

  belongs_to :user

  scope :old, -> { where('created_at <= ?', 24.hours.ago) }
end
