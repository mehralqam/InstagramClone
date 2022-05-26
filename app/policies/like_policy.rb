# frozen_string_literal: true

class LikePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      @scope.all
    end
  end

  def create?
    record.user_id == user.id || record.user.inverse_followers.exists?(user.id)
  end

  def destroy?
    record.user = user
  end
end
