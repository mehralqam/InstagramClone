# frozen_string_literal: true

module UserHelper
  def find_other_accounts(follow)
    if follow!=current_user && current_user.followers!=follow
      return follow
    end
  end
end
