module SecretsHelper

  def create_secret secret_params
    secret = Secret.new(secret_params)
    secret[:user_id] = session[:user_id]
    secret[:provider_id] = secret_params[:provider_id]
    puts secret.to_s
    secret
  end

end
