class UsersController < ApplicationController
  layout 'blank'

  after_action :verify_authorized, only: [:show]

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    authorize @user
  end

  # GET /profile
  def profile
    @user = User.find(current_user.id)
    render 'show'
  end
end
