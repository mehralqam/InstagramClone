# frozen_string_literal: true

# app / controllers / storiess_controller.rb

# Controller to show stories of users and make new ones
class StoriesController < ApplicationController
  before_action :authenticate_user?, only: %i[index show destroy new]
  before_action :set_story, only: %i[destroy update edit]

  def index
    @stories = Story.all
  end

  def show
    @user_story = Story.where(user_id: params[:id]).page params[:page]
  end

  def create
    @story = current_user.stories.new(story_params)
    respond_to do |format|
      if @story.save
        format.html { redirect_to users_url, notice: 'Story was successfully created.' }
      else
        format.html { render :new, notice: 'Story wasnt successfully created.' }
      end
    end
  end

  def new
    @story = Story.new
  end

  def destroy
    authorize @story
    @story.destroy
    respond_to do |format|
      format.html do
        redirect_to users_url, notice: 'story was successfully destroyed.'
      end
    end
  end

  def edit
    @story = Story.find(params[:id])
  end

  def update
    current_user.stories.create!(story_params)
    @user_story = Story.where(user_id: current_user.id)
    if current_user.stories.create!(story_params)
      redirect_to root_path, notice: 'Story updated.'
    else
      render 'edit', notice: 'Story wasnot updated.'
    end
  end

  private

  def authenticate_user?
    if user_signed_in?
      true
    else
      redirect_to root_url, notice: 'You dont have right to view this page.'
    end
  end

  def story_params
    params.require(:story).permit(:image)
  end

  def set_story
    @story = Story.find(params[:id])
  end
end
