# frozen_string_literal: true

module FollowshipHelper
  def find_user(id)
    @user=User.find_by("id = ?", id)
    @user
  end
end
