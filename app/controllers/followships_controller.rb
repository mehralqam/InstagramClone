# home controller
# frozen_string_literal: true

class FollowshipsController < ApplicationController
  def create
    @followship = current_user.followships.build(:follower_id => params[:follower_id])
    if @followship.save
      flash[:notice] = "Added following"
      redirect_to root_url
    else
      flash[:error] = "Unable to add following."
      redirect_to root_url
    end
  end

  def index
    @user = current_user
    @followers= current_user.followers
    @my_followers=Followship.user_specific_followers(current_user)
  end

  def destroy
    @followship = Followship.find(params[:id])
    @followship.destroy
    flash[:notice] = "Removed following."
  end
end
