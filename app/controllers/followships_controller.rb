# home controller
# frozen_string_literal: true

class FollowshipsController < ApplicationController
  def create
    @followship = current_user.followships.build(:follower_id => params[:follower_id])
    if @followship.save
      flash[:notice] = "Added follower"
      redirect_to root_url
    else
      flash[:error] = "Unable to add follower."
      redirect_to root_url
    end
  end

  def index
    @followers= current_user.followers

  end

  def destroy
    @followship = Followship.find(params[:id])
    @followship.destroy
    flash[:notice] = "Removed follower."
    redirect_to current_user
  end
end
