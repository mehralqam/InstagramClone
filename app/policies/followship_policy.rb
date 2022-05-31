# frozen_string_literal: true

class FollowshipPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      @scope.all
    end
  end

  def index; end

  def destroy?
    record.user == user
  end

  def edit?
    @record.user == current_user
  end

  def show?
    record.user == user
  end
end
