# frozen_string_literal: true

# app/controller/posts_controller

# Requests controller handles all the requests of user

class FollowrequestsController < ApplicationController

  def index
    @requests = Followrequest.where(follow_user_id: current_user)
  end

  def create
    begin
      @request = Followrequest.new(followrequest_params)
      @request.save
      rescue => e
    end
  end

  def new
    @request = Followrequest.new
  end


  private
  def followrequest_params
    params.permit(:follow_user_id, :user_id, :follow_user_name,:user_name)
  end
end
