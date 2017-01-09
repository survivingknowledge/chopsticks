class LoginController < AppController

  # the /? allows user to enter /login or /login/ to both be valid
  get '/login/?' do
    if !logged_in?
      erb :'login/login_form'
    else
      redirect '/'
    end
  end

  post '/login' do
    #reset login errortext
    session["login_error"] = ""
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      #ok so if we don't redirect or render something it throws status must be >= 100
      redirect '/'
    else
      session["login_error"] = "username and/or password failed"
      redirect '/login'
    end
  end

  get '/logout/?' do
    if logged_in?
      session.clear
      redirect '/'
    else
      redirect '/login'
    end
  end

end
