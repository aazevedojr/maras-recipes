module SessionsHelper
  def login(user)
    session[:id] = user.id
  end

  def logout
    session[:id] = nil
    @current_user = nil
  end

  def current_user
    @current_user ||= User.find( session[:id] ) if session[:id]
  end

  def current_user?(user)
    user == current_user
  end

  def logged_in?
    !current_user.nil?
  end

  protected

  def authenticate!
    redirect_to new_session_path and return unless logged_in?
  end
end
