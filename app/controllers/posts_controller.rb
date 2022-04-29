# frozen_string_literal: true

# app/controllers/posts_controller.rb

# Controller to show posts of users and make new ones
class PostsController < ApplicationController
  before_action :set_post, only: %i[show]
  def index
    @posts = policy_scope(Post).order('created_at DESC')
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new(post: @post)
    @users = User.all
  end

  def create
    @post = current_user.posts.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to action: 'index', notice: 'Post was successfully created.' }

      else
        format.html { render :new, notice: 'Post wasnt successfully created.' }
      end
    end
  end

  def new
    @post = Post.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def set_post
    @post = Post.find_by(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def post_params
    params.require(:post).permit(images: [])
  end
end
