class SessionController < ApplicationController
  def new
    if !(is_signed_in?)
        @user = User.new
      else
        redirect_to "/projects"
      end
  end

  def create
    user = User.find_by(email: session_params[:email])
    puts user
    if user && user.authenticate(session_params[:password])
      sign_in(user)
      puts current_user
      redirect_to "/projects"
    else
      render plain: "Log In Failed"
    end
  end


  def destroy
    sign_out
  end


  private

  def session_params
    params.require(:user).permit(:email, :password)
  end

end
