class UsersController < ApplicationController

  def show
    @user = current_user

    @github_secret
    if @user.secrets.all.find_by(:provider_id => 1)
      @github_secret = @user.secrets.all.find_by(:provider_id => 1)
    else
      @user.secrets.new({ :provider_id => 1 })
    end
    puts @github_secret.to_s

    @netlify_secret
    if @user.secrets.all.find_by(:provider_id => 2)
      @netlify_secret = @user.secrets.all.find_by(:provider_id => 2)
    else
      @netlify_secret = @user.secrets.new({ :provider_id => 2 })
    end
    puts @netlify_secret.to_s

    @sonar_cloud_secret
    if @user.secrets.all.find_by(:provider_id => 3)
      @sonar_cloud_secret =  @user.secrets.all.find_by(:provider_id => 3)
    else
      @sonar_cloud_secret = @user.secrets.new({ :provider_id => 3 })
    end
    puts @sonar_cloud_secret.to_s

  end

  def new
    @user = User.new
  end


  def create
    user = User.new(user_params)
    if user.save
      render plain: "Successfully Created User"
    else
      render plain: "Failed to create user"
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end


end
