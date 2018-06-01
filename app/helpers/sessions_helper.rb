module SessionsHelper

  def log_in(user)
    session[:user_slug] = user.slug
  end

  def log_out
    session.delete(:user_slug)
    @current_user = nil
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_slug])
  end

  def logged_in?
    !current_user.nil?
  end
end
