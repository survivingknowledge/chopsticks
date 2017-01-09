#why add in this line?
require './config/environment'

class AppController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'super-secret-chopsticks'
  end

  helpers do
     def logged_in?
       !!session[:user_id]
     end

     def current_user
       User.find(session[:user_id])
     end
  end

  get '/' do
    erb :'homepage'
  end

  #woo correctly catches bad urls while still allowing us to access other controlelrs
  get '/*' do
    "testing out splat for better catching bad urls"
    redirect '/'
  end

end