# frozen_string_literal: true

# app/controller/likes_controller

# likes controller handles all the post likes of user

class LikesController < ApplicationController
  before_action :set_post
  before_action :set_like, only: [:destroy]

  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @post.likes.create(user_id: current_user.id)
    end
    redirect_to post_path(@post)
  end

  def destroy
    if !already_liked?
      flash[:notice] = 'Cannot unlike'
    else
      @like.destroy
    end
    redirect_to post_path(@post)
  end

  private

  def set_like
    @like = @post.likes.find_by(id: params[:id])
    flash[:notice] = "Like with id #{params[:id]} doesnt exist" if @like.blank?
  end

  def set_post
    @post = Post.find_by(id: params[:post_id])
    return redirect_to root_path if @post.nil?
  end

  def already_liked?
    Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
  end
end
