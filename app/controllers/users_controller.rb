# user controller
# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = current_user
   end

  def create
    @user = User.new
   end

  def new
    @user = User.new
   end

  def index
    @user = User.all
    @can_follow_users = User.can_follow_users(current_user)
  end

  def update
    if @post.update_attributes(params[:user])
      else
        render edit_user_registration_path
    end
  end
end
