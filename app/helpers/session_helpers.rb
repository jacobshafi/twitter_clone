helpers do

  def current_user
    if sessionp[:id]
      User.find_by(id: session[:id])
    else
      nil
    end
  end

  def logged_in?
    !session[:user_id].nil?
  end

  def set_session(id)
    session[:id] = id
  end

  def logout
    session[:id] = nil
  end

end



