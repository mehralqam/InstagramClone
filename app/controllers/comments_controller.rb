# frozen_string_literal: true

# app/controllers/comments_controller.rb

# Controller to show comments of users and make new ones
class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]
  before_action :set_post, only: %i[create edit update]
  before_action :authorize_comment, only: %i[destroy update]

  def create
    @comment = @post.comments.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: 'Comment created successfully' }
      else
        format.html { render action: 'new', notice: 'Something went wrong, Please try again' }
      end
      format.js
    end
  end

  def edit; end

  def update
    if @comment.update(comment_params)
      redirect_to @comment.post, notice: 'Your comment is successfully updated'
    else
      render 'edit', notice: 'Something went wrong, comment is not updated'
    end
  end

  def destroy
    if @comment.destroy
      redirect_to @comment.post, notice: 'Your comment is successfully deleted'
    else
      redirect_to @comment.post, notice: 'Something went wrong, comment is not deleted'
    end
  end

  private

  def set_post
    @post = Post.find_by(id: params[:post_id])
    flash[:notice] = "Post with id #{params[:id]} doesnt exist" if @post.blank?
  end

  def set_comment
    @comment = Comment.find_by(id: params[:id])
    flash[:notice] = 'Comment doesnt exist' if @comment.blank?
  end

  def comment_params
    params.require(:comment).permit(:description).tap do |additional_params|
      additional_params[:user_id] = current_user.id
    end
  end

  def authorize_comment
    authorize @comment
  end
end
