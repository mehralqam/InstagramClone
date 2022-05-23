# frozen_string_literal: true

module ApplicationHelper
  def can_edit_profile? user_id
    user_signed_in? && current_user.id == user_id
  end
end
