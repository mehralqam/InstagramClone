# frozen_string_literal: true

module UserHelper
  def find_other_accounts(follow)
    if follow!=current_user && current_user.followers!=follow
      return follow
    end
  end

  def render_follow_button(suggest)
    if User.follow_request(current_user).exists?(suggest.id)
      link_to 'Follow Request',user_followrequests_path(current_user,follow_user_id: suggest.id,follow_user_name: suggest.user_name, status: 0,user_name: current_user.user_name), method: "post" ,id: 'follow-btn',remote: true,class: "btn btn-secondary"
    end
  end
end
