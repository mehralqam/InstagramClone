# frozen_string_literal: true

# app/controller/posts_controller

# Post controller handles all the posts of user

class PostsController < ApplicationController
  before_action :set_post, only: %i[show update destroy]
  before_action :authenticate_user?, only: %i[index show update destroy]
  before_action :authorize_post, only: %i[create show destroy update]

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new(post: @post)
  end

  def create
    @post = current_user.posts.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to action: 'index', notice: 'Post successfully created.' }
      else
        format.html { render :new, notice: 'Something went wrong please try again' }
      end
    end
  end

  def new
    @post = Post.new
  end

  def destroy
    flash[:notice] = if @post.destroy
                       'Post successfully destroyed'
                     else
                       'Something went wrong please try again'
                     end
    redirect_to posts_path
  end

  def update
    flash[:notice] = if @post.update(params[:post])
                       'Post updated '
                     else
                       'Something went wrong please try again'
                     end
  end

  private

  def post_params
    params.require(:post).permit(:caption, images: [])
  end

  def set_post
    @post = Post.find_by(id: params[:id])
    flash[:notice] = "Post with id #{params[:id]} doesnt exist" if @post.nil?
  end

  def authorize_post
    authorize @post if @post.present?
  end

  def authenticate_user?
    if user_signed_in?
      true
    else
      redirect_to root_url, notice: 'You dont have right to view this page.'
    end
  end
end
