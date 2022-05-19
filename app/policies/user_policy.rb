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

  def edit?
    @record.user == current_user
  end

  def show?
    ecord.user == user
  end
end
