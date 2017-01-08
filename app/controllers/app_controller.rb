#why add in this line?
require './config/environment'

class AppController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'super-secret-chopsticks'
  end

  get '/' do
    erb :'homepage'
  end

end