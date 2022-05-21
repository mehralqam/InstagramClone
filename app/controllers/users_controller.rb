# frozen_string_literal: true

# app / controllers / Users_controller.rb

# Controller to users
class UsersController < ApplicationController
  def create
    @user = User.new
    respond_to do |format|
      if @user.save
        format.html { redirect_to action: 'index', notice: 'User was successfully created.' }

      else
        format.html { render :index, notice: 'User wasnt successfully created.' }
      end
    end
  end

  def new
    @user = User.new
  end

  def index
    @users = User.where('id != ?', current_user)
    @can_follow_users = User.can_follow_users(current_user)
    @searched_users = @users.search_users(params[:search]) if params[:search]
    respond_to do |format|
      format.js
      format.html
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    flash[:notice] = if @user.present?
                       'User exist'
                     else
                       'User not exist'
                     end
  end

  def search_results
    render partial: 'users/userdashboard', locals: { user: params[:user] }, class: 'btn btn-secondary'
  end

  def update
    @post.update(params[:user])
  end

  def user_params
    params.require(:user).permit(:search)
  end
end
