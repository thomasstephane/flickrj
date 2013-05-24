
####### sass support ######
require 'sass'

get '/css/application.css' do
  scss :application
end



get '/' do
  erb :index
end

get '/upload' do
  p session
  if session[:user_id]
    @user = current_user
    erb :upload
  else
    redirect '/signin'
  end
end

post '/upload' do
  Picture.create(url: params[:image], user_id: session[:user_id],
    album_id: "1")
  redirect '/'
end

post '/album' do
  Album.create(:user_id => session[:user_id], :name => params[:name])
  redirect "/users/#{session[:user_id]}/albums"
end