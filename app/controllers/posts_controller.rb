# frozen_string_literal: true

# app/controller/posts_controller

# Post controller handles all the posts of user

class PostsController < ApplicationController
  before_action :set_post, only: %i[update destroy]
  before_action :authenticate_user?, only: %i[index show update destroy]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    authorize @post
    @comment = Comment.new(post: @post)
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

  def update
    @post.update(params[:post])
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
end
