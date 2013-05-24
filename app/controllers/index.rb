
####### sass support ######
require 'sass'

get '/css/application.css' do
  scss :application
end



get '/' do
  # Look in app/views/index.erb
  erb :index
end

