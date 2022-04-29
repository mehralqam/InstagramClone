# post controller
# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show]
  def index
    @posts = policy_scope(Post)
  end

  def show; end

  def create
    @post = current_user.posts.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to action: 'index', notice: 'Post was successfully created.' }
      else
        format.html { render :new, notice: 'Post not created.' }
      end
    end
  end

  def new
    @post = Post.new
  end

  def destroy
    @post.destroy!
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully deleted.' }
    rescue ActiveRecord::RecordNotFound
      flash[:message] = 'Record was already destroyed'
    rescue ActiveRecord::RecordNotDestroyed
      flash[:message] = 'Record was not destroyed'
    end
  end

  private

  def set_post
    @post = Post.find_by(params[:id])
  end

  def post_params
    params.require(:post).permit(images: [])
  end
end
