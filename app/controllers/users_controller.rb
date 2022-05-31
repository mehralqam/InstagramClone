# frozen_string_literal: true

# app / controllers / Users_controller.rb

# Controller to users
class UsersController < ApplicationController
  def create
    @user = User.new
    respond_to do |format|
      if @user.save
        format.html { redirect_to action: 'index', notice: 'User successfully created.' }
      else
        format.html { render :index, notice: 'User not created successfully.' }
      end
    end
  end

  def new
    @user = User.new
  end

  def index
    @users = User.where('id != ?', current_user)
    @open_account_users = User.open_account_users(current_user)
    @searched_users = @users.search_users(params[:search]) if params[:search]
    respond_to do |format|
      format.js
      format.html
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    flash[:notice] = "User with id #{params[:id]} doesnt exist" if @user.blank?
  end

  def edit; end

  def update
    flash[:notice] = if @user.update(params[:user])
                       'User profile updated '
                     else
                       'User profile can not be updated'
                     end
  end

  private

  def user_params
    params.require(:user).permit(:search, :avatar)
  end

  def search_results
    render partial: 'users/dashboard', locals: { user: params[:user] }, class: 'btn btn-secondary'
  end
end
