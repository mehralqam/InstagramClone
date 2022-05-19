#frozen_string_literal: true

# app / controllers / Users_controller.rb

# Controller to users
class UsersController < ApplicationController
  def create
    @user = User.new
  end

  def new
    @user = User.new
  end

  def index
    @users = User.where('id != ?', current_user)
    @can_follow_users = User.can_follow_users(current_user)# @followers = current_user.followers# authorize @followers
    @searched_users = @users.search_users(params[:search]) if params[:search].present?
    respond_to do |format |
      format.js
      format.html
    end
  end

  def search_results
    render partial: 'users/userdashboard', locals: {user: params[:user]}, class: 'btn btn-secondary'
  end

  def update
    if @post.update_attributes(params[:user])
    else
      render edit_user_registration_path
    end
  end

  def user_params
    params.require(:user).permit(:search)
  end
end
