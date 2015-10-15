def logged_in?
  !!session[:user_id]
end

def current_user
  logged_in? ? User.find_by(id: session[:user_id]) : User.new
end

def current_user_name
  logged_in? ? session[:user_name] : User.new
end

def login(user)
  session[:user_id] = user.id
  session[:user_name] = user.name
end

def logout
  session.clear
end