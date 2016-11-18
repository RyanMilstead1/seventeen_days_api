class ActivationCodesController < ApplicationController

  def show
    render json: get_activation_codes(params[:code], params[:user_id])
  end

  def create
    render json: activate_code_for_user(params[:code], params[:user_id])
  rescue => e
    render json: { exception: e }, status: 422
  end

  private

  def get_not_activated_codes(code)
    ActivationCode.where(code: code, user_id: nil, activated_on: nil)
  end

  def activate_code_for_user(code, user_id)
    code = get_not_activated_codes(code).first

    if code.nil?
      raise 'Activation Code does not exist or was previously activated'
    end
    code.activate(user_id)
    code
  end

  def get_activation_codes(code, user_id)
    if code.present? and user_id.present?
      return ActivationCode.where(user_id: user_id, code: code)
    elsif code.present?
      return ActivationCode.where(code: code)
    elsif user_id.present?
      return ActivationCode.where(user_id: user_id)
    end

    ActivationCode.all
  end

  # rescue_from ActivationCodesController::create' do |exception|
  #   pp '================================================foo foo============================'
  # end
end
