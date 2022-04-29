# post controller
# frozen_string_literal: true

class StoriesController < ApplicationController
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
        format.html { redirect_to action: 'index', notice: 'Story was successfully created.' }
      else
        format.html { render :new, notice: 'Story was successfully created.' }
      end
    end
  end

  def new
    @story = Story.new
  end

  def story_params
    params.require(:story).permit(:image)
  end

  def destroy
    @story.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'story was successfully destroyed.' }
    end
  end
end
