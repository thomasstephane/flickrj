helpers do 
  def loggedin?
    session[:user_id] != nil
  end
end