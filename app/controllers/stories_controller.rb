# frozen_string_literal: true

# app/controllers/storiess_controller.rb

# Controller to show stories of users and make new ones
class StoriesController < ApplicationController
  before_action :authenticate_user?, only: [:index,:show,:edit,:update, :destroy, :new]
  def index
    @stories = Story.page params[:page]
  end

  def show
    @story = Story.find(params[:id])
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

  def destroy
    @stories.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'story was successfully destroyed.' }
    end
  end

  private
  def authenticate_user?
    if(user_signed_in?)
      return true
    else
      redirect_to root_url, notice: 'You dont have right to view this page.'
  end
end
def story_params
  params.require(:story).permit(:image)
end

end
