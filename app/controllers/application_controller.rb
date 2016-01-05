class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError do |exception|
    redirect_to root_path, :alert => 'You are not authorized to perform this action.'
  end

  def authenticate_user_from_token!
    user = user_token && User.find_by_unique_identifier(user_token.to_s)
    sign_in(user, store: false) if user
  end

  def user_token
    @user_token ||= params[:user_token].presence
  end
end
