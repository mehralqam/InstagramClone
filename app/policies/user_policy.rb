# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      @user==user
    end

    def destroy?
      record.user == user
    end

    def edit?
      @record.user == current_user
    end

    def delete?
      @record.user == current_user
    end

    def show?
      ecord.user == user
    end
 end
end

