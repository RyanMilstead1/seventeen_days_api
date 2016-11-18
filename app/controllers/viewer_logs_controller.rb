class ViewerLogsController < ApplicationController

  def index
    render json: ViewerLog.all
  end

  def show
    render json: ViewerLog.find(params[:id])
  end

  def create
    marker = AppMarker.find_or_create_by(marker: params[:marker])
    ViewerLog.create!(action: params[:thisaction], marker: params[:marker], user_id: current_user.id, app_marker: marker)
  end
end
