module SessionsHelper
  def log_in(zduser)
    session[:user_id] = user.id
  end

  def crrent_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
end