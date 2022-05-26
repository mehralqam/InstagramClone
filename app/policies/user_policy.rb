# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
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
    true
  end

  def update?
    record.user == user
  end

  def edit?
    record.user == user
  end
end
