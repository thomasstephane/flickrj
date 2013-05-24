
####### sass support ######
require 'sass'

get '/css/application.css' do
  scss :application
end



get '/' do
  erb :index
end

get '/upload' do
  if session[:user_id]
    @user = current_user
    erb :upload
  else
    redirect '/signin'
  end
end

post '/upload' do
  pic = Picture.new
  pic.file = params[:image]
  pic.user_id = session[:user_id]
  pic.album_id = params[:album]
  pic.save
  redirect "/albums/#{pic.album_id}/picture/#{pic.id}"
end

get '/album' do
  if session[:user_id]
    @user = current_user
    erb :albums
  else
    redirect '/signin'
  end
end

post '/album' do
  Album.create(:user_id => session[:user_id], :name => params[:name])
  redirect "/users/#{session[:user_id]}/albums"
end

get '/users/:user_id/albums' do |user_id|
  if session[:user_id] == user_id.to_i
    @user = current_user
    erb :albums
  else
    redirect '/'
  end
end

get '/albums/:album_id' do |album_id|
  @album = Album.find(album_id)
  erb :album
end

# single pic
get '/albums/:album_id/picture/:picture_id' do |album_id, picture_id|
  @picture = Picture.find(picture_id)
  erb :picture
end
