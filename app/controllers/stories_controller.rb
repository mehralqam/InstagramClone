# frozen_string_literal: true

# app/controllers/storiess_controller.rb

# Controller to show stories of users and make new ones
class StoriesController < ApplicationController
  before_action :set_story, only: %i[show]
  def index
    @stories = Story.page params[:page]
  end

  def show
    @story = Story.find_by(:id)
  end

  def create
    @story = current_user.stories.new(story_params)
    respond_to do |format|
      if @story.save
        format.html { redirect_to post_url(@story), notice: 'Story was successfully created.' }
      else
        format.html { render :new, notice: 'Story not created.' }
      end
    end
  end

  def new
    @story = Story.new
  end

  private

  def story_params
    params.require(:story).permit(:image)
  end

  def set_story
    @story = Story.find_by(params[:id])
  end
end
