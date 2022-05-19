# frozen_string_literal: true

# app/controller/posts_controller

# Post controller handles all the posts of user

class PostsController < ApplicationController
  before_action :set_post, only: %i[edit update destroy post_like]
  before_action :authenticate_user?, only: %i[index show edit update destroy]

  before_action :like_inc, only: [:post_like]

  def index
    @posts = policy_scope(Post)
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
    @post.destroy
    redirect_to posts_path
  end

  def edit; end

  def update
    if @post.update_attributes(params[:post])
    else
      render 'edit'
    end
  end

  def post_like
    @post.update(likes: @post.likes)
    redirect_to @post
  end

  private

  def post_params
    params.require(:post).permit(:caption, images: [])
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def authenticate_user?
    if user_signed_in?
      true
    else
      redirect_to root_url, notice: 'You dont have right to view this page.'
    end
  end

  def like_inc
    @post.likes = @post.likes + 1
  end
end
