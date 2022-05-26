# frozen_string_literal: true

# app/controller/posts_controller

# Requests controller handles all the requests of user

class FollowRequestsController < ApplicationController
  def index
    @requests = current_user.follow_requests.all
  end

  def create
    @request = FollowRequest.new(follow_request_params)
    if @request.save
      flash[:notice] = 'Your Request is successfully sent'
    else
      flash[:error] = 'Something went wrong, Please try again.'
    end
  end

  def new
    @request = FollowRequest.new
  end

  private

  def follow_request_params
    params.permit(:follow_user_id, :user_id)
  end
end
