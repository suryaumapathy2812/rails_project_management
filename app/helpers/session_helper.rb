module SessionHelper

  attr_accessor :current_user

  # Setter method
  def current_user(user)
    @current_user = user
  end

  # Getter Method
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


  def sign_in user
    puts user
    session[:user_id] = user.id
    @current_user = user
  end

  def is_signed_in?
    puts !current_user.nil?
    !current_user.nil?
  end


  def sign_out
    session[:user_id] = nil
    @current_user = nil
  end

  def full_name
    @current_user.first_name + " " + @current_user.last_name
  end

end
