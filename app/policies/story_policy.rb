# frozen_string_literal: true

class StoryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      @scope.all
    end
  end
  def index
    true
  end

  def create?
    true
  end

  def new?
    true
  end

  def show?
    record.user_id == user || record.user.inverse_followers.includes(user)
  end

  def destroy?
    record.user == user
  end

  def update?
    record.user == user
  end

  def edit?
    record.user == user
  end
end
