# frozen_string_literal: true

module LikeHelper
  def already_liked?
    Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
  end
end
