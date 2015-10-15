get '/users/new/?' do
  @user = User.new
  @errors = session[:errors] || []
  session.delete(:errors)
  erb :'users/new'
end

post '/users' do
  user = User.new(params[:user])
  errors = []
  errors << "Password cannot be blank" if params[:user][:password].empty?
  errors << "Password must be at least 6 characters" if params[:user][:password].size < 6
  user.valid?
  errors += user.errors.full_messages
  if errors.empty? && user.save
    redirect '/'
  else
    session[:errors] = errors
    redirect '/users/new'
  end
end

get '/users/login/?' do
  @user = User.new
  @errors = params[:errors] || []
  erb :'users/login'
end

post '/users/login' do
  user = User.find_by(name: params[:user][:name])
  if user.password == params[:user][:password]
    login(user)
    redirect '/'
  else
    @user = User.new
    @errors = ["Username and password don't match"]
    erb :'users/login'
  end
end

get '/users/logout/?' do
  logout
  redirect '/'
end

get '/users/:name' do
  if logged_in?
    @user = User.find_by(name: params[:name])
    erb :'users/show'
  else
    status 404
  end
end


