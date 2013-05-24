post '/signup' do 
  content_type :json
  if User.find_by_name(session[:name])
    {msg: "Username already taken"}.to_json
  elsif User.find_by_email(session[:email])
    {msg: "Email already taken"}.to_json
  else
    @user = User.create(name: session[:name], email: session[:email], password: session[:password])
    session[:user_id] = @user.id
    {msg: "Welcome in!"}.to_json
  end
end

post '/signin' do 
  if session[:user_id]
    {msg: "logged in already!"}.to_json
  elsif authenticate(session[:name],session[:password])
    session[:user_id] = User.find_by_name(session[:name])
    {msg: "logged in!"}.to_json
  else
    {msg: "That doesn't seem right, try again"}.to_json
  end
end

get '/logout' do
  session.clear
  redirect '/'
end