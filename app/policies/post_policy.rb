# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      @scope.includes(:comments).all
    end
  end

  def destroy?
    record.user == user
  end

  def edit?
    record.user == user
  end

  def show?
    record.user_id == user || record.user.inverse_followers.includes(user)
  end
end
