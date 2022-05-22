# frozen_string_literal: true

module UserHelper
  def find_other_accounts(follow)
    follow if follow != current_user && current_user.followers != follow
  end

  def request_button(suggest)
    link_to('Follow Request', user_followrequests_path(user_id: suggest.id, user_name: suggest.user_name,
                                                       follow_user_id: current_user.id,
                                                       follow_user_name: current_user.user_name,
                                                       status: 0), method: 'post', id: 'follow-btn',
                                                                   class: 'btn btn-secondary')
  end

  def render_follow_button(suggest)
    if User.follow_request(current_user).exists?(suggest.id)
      request_button(suggest)
    elsif User.can_follow_users(current_user).exists?(suggest.id)
      link_to('Follow', followships_path(user_id: current_user.id, follower_id: suggest.id),
              method: :post, class: 'btn btn-secondary', id: 'public_follow', remote: true)
    end
  end
end
