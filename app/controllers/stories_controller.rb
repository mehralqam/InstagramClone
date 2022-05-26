# frozen_string_literal: true

# app / controllers / storiess_controller.rb

# Controller to show stories of users and make new ones
class StoriesController < ApplicationController
  before_action :authenticate_user?, only: %i[index show destroy new]
  before_action :set_story, only: %i[destroy update edit]
  before_action :authorize_story, only: %i[destroy update edit]

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
        format.html { redirect_to users_url, notice: 'Story successfully created.' }
      else
        format.html { render :new, notice: 'Something went wrong,Story not created.' }
      end
    end
  end

  def new
    @story = Story.new
  end

  def destroy
    flash[:notice] = if @story.destroy
                       'Story successfully removed '
                     else
                       'Something went wrong,Story not removed '
                     end
  end

  def edit; end

  def update
    if current_user.stories.create(story_params)
      redirect_to root_path, notice: 'Story updated successfully'
    else
      render 'edit', notice: 'Something went wrong,Story not updated.'
    end
  end

  private

  def story_params
    params.require(:story).permit(:image)
  end

  def set_story
    @story = Story.find_by(id: params[:id])
    flash[:notice] = "Story with id #{params[:id]} doesnt exist" if @story.blank?
  end

  def authorize_story
    authorize @story
  end

  def authenticate_user?
    if user_signed_in?
      true
    else
      redirect_to root_url, notice: 'You dont have right to view this page.'
    end
  end
end
