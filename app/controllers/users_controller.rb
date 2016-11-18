class UsersController < ApplicationController

  def show
    if user_signed_in?
      render json: User.find(params[:id]).as_json
    else
      render json: { success: false, errors: ["You must be logged in to do that"] }, status: 401
    end
  end
end
