# frozen_string_literal: true

class Followrequest < ApplicationRecord
  belongs_to :user

  enum status: {
    pending: 0,
    accepted: 1
  }

end
