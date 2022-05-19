# home controller
# frozen_string_literal: true

class FollowshipsController < ApplicationController
  before_action :set_followship, only: [:destroy]

  def new
    @followship = current_user.followships.new
  end

  def create
    @followship = Followship.new(followship_params)
    if @followship.save
      flash[:notice] = 'Added following'
    else
      flash[:error] = 'Unable to add following.'
    end
    redirect_to root_url
  end

  def index
    @user = current_user
    @followers = current_user.followers
    @my_followers = Followship.user_specific_followers(current_user)
  end

  def destroy
    if @followship.destroy
      flash[:notice] = 'Successfully Removed'
    else
      flash[:error] = 'Unable to Remove'
    end
    redirect_to root_url
  end

  private

  def set_followship
    @followship = Followship.find(params[:id])
  end

  def followship_params
    params.permit(:user_id, :follower_id)
  end
end
