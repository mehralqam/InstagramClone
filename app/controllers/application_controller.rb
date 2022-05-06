# frozen_string_literal: true

# app/models/user.rb

# Service to download ftp files from the server

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_current_user
  include Pundit

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name, :account_type, :avatar, { images: [] }])
  end

  def after_sign_in_path_for(_resource)
    posts_path
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to root_path
  end

  def set_current_user
    @current=@user
  end

end
