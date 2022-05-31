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
      flash[:notice] = 'Request sent'
    else
      flash[:error] = 'You have already requested'
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
