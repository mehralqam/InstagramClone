# frozen_string_literal: true

# app/controllers/storiess_controller.rb

# Controller to show stories of users and make new ones
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
        format.json { render :show, status: :created, location: @story }

      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @story.errors, status: :unprocessable_entity }
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
      format.json { head :no_content }
    end
  end
end
