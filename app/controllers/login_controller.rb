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
    user = User.find_by(:username => params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
    end
    redirect '/'
  end

end
