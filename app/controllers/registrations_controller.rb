class RegistrationsController < DeviseTokenAuth::RegistrationsController
  before_action :configure_permitted_parameters, :only => :update
  before_action :set_user_by_token, :only => [:destroy, :update]
  before_action :validate_sign_up_params, :only => :create
  before_action :validate_account_update_params, :only => :update
  skip_after_action :update_auth_header, :only => [:create, :destroy]

  after_action :activate_code, :only => :create

  def activate_code
    if params[:activationCode]

      code = ActivationCode.where(code: params[:activationCode], user_id: nil, activated_on: nil).first

      if code.nil?
        raise 'Activation Code does not exist or was previously activated'
      end
      code.activate(User.last.id)
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:position, :jessicas_room, :current_file, :current_file_time, :current_key])
  end
end
