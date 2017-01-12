#why add in this line?
require './config/environment'

class AppController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'super-secret-chopsticks'
  end

  before do
  #   @user ||= current_user
  end

  helpers do
     def logged_in?
       !!session[:user_id]
     end

     def current_user
       if logged_in?
         User.find(session[:user_id])
       end
     end
  end

  get '/' do
    @page = {}
    @page[:title] = "Homepage"
    @user = current_user
    erb :'homepage'
  end

  not_found do
    redirect '/'
  end

end