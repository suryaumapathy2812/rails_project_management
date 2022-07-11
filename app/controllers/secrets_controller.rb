class SecretsController < ApplicationController
  include SecretsHelper


  def show
    puts session[:user_id]
    @secret = Secret.all.where({:user_id => session[:user_id]})
    puts @secret.length
  end

  def new
    puts session[:user_id]
    @provider = Provider.all.map { |p|  [ p.name, p.id ]  }
    @data = Secret.new({:user_id => session[:user_id]})
  end


  def create
    @secret = create_secret(secret_params)

    if @secret.save
      render plain: "Successful"
    else
      puts @secret.errors.full_messages
      render plain: "Failed"
    end
  end


  private

  def secret_params
    params.require("secret").permit(:provider_id, :user_id, :token, :client_id, :client_secret)
  end

end
