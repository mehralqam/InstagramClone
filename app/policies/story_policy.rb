# frozen_string_literal: true

class StoryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      @scope.all
    end
  end

  def destroy?
    record.user == user
  end

  def edit?
    record.user == user
  end

end
