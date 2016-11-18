class OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController
  
  def omniauth_success
    user = get_resource_from_auth_hash
    auth_hash['info']['email'] = user.email.present? ? user.email : "#{user.nickname}@#{params[:provider]}"
    super
  end
end
