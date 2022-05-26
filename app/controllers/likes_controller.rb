# frozen_string_literal: true

# app/controller/likes_controller

# likes controller handles all the post likes of user

class LikesController < ApplicationController
  before_action :set_post
  before_action :set_like, only: [:destroy]
  before_action :authorize_like, only: %i[destroy create]

  def create
    if already_liked?
      flash[:notice] = 'You have already liked this post'
    else
      @post.likes.create(user_id: current_user.id)
    end
  end

  def destroy
    if !already_liked?
      flash[:notice] = 'Something went wrong,You can not unlike this post'
    else
      @like.destroy
    end
  end

  private

  def set_like
    @like = @post.likes.find_by(id: params[:id])
    flash[:notice] = "Like with id #{params[:id]} doesnt exist" if @like.blank?
  end

  def set_post
    @post = Post.find_by(id: params[:post_id])
    flash[:notice] = "Post with id #{params[:id]} doesnt exist" if @post.nil?
  end

  def already_liked?
    Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
  end

  def authorize_like
    authorize @like
  end
end
