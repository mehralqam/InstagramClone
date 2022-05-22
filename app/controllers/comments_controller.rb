# frozen_string_literal: true

# app/controllers/comments_controller.rb

# Controller to show comments of users and make new ones
class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]
  before_action :set_post, only: %i[create edit update]

  def create
    @comment = @post.comments.new(comment_params).tap do |c|
      c.user_id = current_user.id
      c.save!
    end
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: 'Comment was successfully created.' }
      else
        format.html { render action: 'new', notice: 'Comment wasnot created.' }
      end
      format.js
    end
  end

  def edit; end

  def update
    authorize @comment
    if @comment.update(comment_params)
      redirect_to @comment.post, notice: 'Comment updated.'
    else
      render 'edit', notice: 'Comment wasnot updated.'
    end
  end

  def destroy
    authorize @comment
    if @comment.destroy
      redirect_to @comment.post, notice: 'Comment successfully deleted.'
    else
      redirect_to @comment.post, notice: 'Comment was not deleted.'
    end
  end

  private

  def set_post
    @post = Post.find_by(id: params[:post_id])
  end

  def set_comment
    @comment = Comment.find_by(id: params[:id])
  end

  def comment_params
    params.require(:comment).permit(:description)
  end
end
