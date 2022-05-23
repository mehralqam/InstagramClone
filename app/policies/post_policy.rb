# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  byebug
  class Scope < Scope
    def resolve
     @scope.includes(:comments).all
    end
 end

 def index
  byebug
 end

 def destroy?
  byebug
  record.user == user
end

def edit?
 @record.user == current_user
end

def show?
 record.user == user
end
end
