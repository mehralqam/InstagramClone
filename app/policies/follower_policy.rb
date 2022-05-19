# frozen_string_literal: true

class FollowerPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      @scope.includes(:comments).all
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
