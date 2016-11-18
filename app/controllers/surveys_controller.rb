class SurveysController < ApplicationController
  def show
    render json: Survey.find(params[:id])
  end
end
