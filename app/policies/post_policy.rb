# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      @scope.includes(:comments).all
    end
  end

  def create
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def update?
    record.user == user
  end

  def show?
    record.user_id == user.id || record.user.inverse_followers.exists?(user.id)
  end
end
