# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
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
     @record.user == current_user || @record.post.user == current_user
   end

   def show?
     record.user == user
   end
 end
end
