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
    @page = {}
    @page[:title] = "Homepage"
    erb :'homepage'
  end

  not_found do
    redirect '/'
  end

end