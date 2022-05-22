# frozen_string_literal: true

class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      @scope.all
    end
  end

  def destroy?
    record.user.eql? user or record.post.user.eql? user
  end

  def edit?
    record.user.eql? user
  end

  def update?
    record.user.eql? user
  end
end
