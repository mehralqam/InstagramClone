# frozen_string_literal: true

module UserHelper
  def request_button(suggest)
    link_to('Follow Request', user_follow_requests_path(user_id: suggest.id, follow_user_id: current_user.id),
            method: 'post', data: { 'js-request-link' => true }, class: 'btn btn-secondary')
  end

  def render_follow_button(suggest)
    if User.private_account_users(current_user).exists?(suggest.id)
      request_button(suggest)
    elsif User.open_account_users(current_user).exists?(suggest.id)
      link_to('Follow', followships_path(user_id: current_user.id, follower_id: suggest.id),
              method: :post, class: 'btn btn-secondary', data: { 'js-public-link' => true })
    end
  end

  def post_like(post)
    post.likes.find { |like| like.user_id == current_user.id }
  end
end
