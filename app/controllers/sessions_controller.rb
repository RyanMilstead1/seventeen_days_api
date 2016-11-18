class SessionsController < DeviseTokenAuth::SessionsController
  wrap_parameters false
  before_action :re_auth_potential_legacy_user, :only => [:create]

  def render_create_success
    puts 'SUCCESS =============================================='
    if @resource
      render json: { data: @resource.as_json }
    else
      render json: {
        success: false,
        errors: ["Invalid login credentials"]
      }, status: 401
    end
  end

  def re_auth_potential_legacy_user
    email = params[:email]
    password = params[:password]
    user = User.find_by_email(email)
    if !user.nil? && user.legacy_password
      #  We had to remove the Dreamfactory legacy check due to the service crashing
      # if running_in_a_prod_environment and DreamfactoryApi.authenticate({ email: email, password: password }).code != '200'
      #   return failure
      # end
      user.reset_and_remove_legacy_password_flag(password)
      user.save
    end
  end

  def render_new_error
    redirect_to params[:auth_origin_url]
  end

  private

  def running_in_a_prod_environment
    Rails.env.production? or Rails.env.staging?
  end
end
