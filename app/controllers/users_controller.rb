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
    @user=User.all

  end
  def update
  if @post.update_attributes(params[:user])
    else
      render edit_user_registration_path
    end
  end
end
