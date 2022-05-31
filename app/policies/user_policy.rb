# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      @scope.all
    end
  end

  def destroy?
    record.user == user
  end

  def update?
    record.user == current_user
  end
end
