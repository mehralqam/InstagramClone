# frozen_string_literal: true

# app/controllers/Users_controller.rb

# Controller to users
class UsersController < ApplicationController
  def show; end

  def create
    @user=User.new
   end

  def new; end

  def index
    @user = User.all
    @can_follow_users=User.can_follow_users(current_user)
  end
  def update
  if @post.update_attributes(params[:user])
    else
      render edit_user_registration_path
    end
  end
end
