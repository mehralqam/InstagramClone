# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      user.posts
    end

    def destroy?
      record.user == user
    end

    # def edit?
    #   @record.user == current_user
    # end

    # def delete?
    #   @record.user == current_user || @record.post.user == current_user
    # end
  end
end
