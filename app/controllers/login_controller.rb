class LoginController < AppController

  before do
    #have to define or throws error on .empty?
    session[:last_page] ||= ""
  end

  helpers do
    def redirect_to_last_page
      if session[:last_page].empty? || session[:last_page] == '/login'
        redirect '/'
      else
        redirect "#{session[:last_page]}"
      end
    end
  end

  get '/profile' do

    if logged_in?
      @user = current_user
      erb :'login/user_profile'
    else
      session[:last_page] = '/account'
      redirect '/login'
    end
  end

  post '/profile/delete' do
    if !logged_in?
      redirect '/'
    else
      user = current_user
      user.destroy
      redirect '/logout'
    end
  end

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
      #we want to redirect to last page before login else to /
      #example, visiting /loginrequired , gets sent to /login, will redirect to /loginrequired
      redirect_to_last_page
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
      #weird bug where if revisiting site
      session.clear
      redirect '/login'
    end
  end



  get '/signup/?' do
    if logged_in?
      redirect '/'
    else
      erb :'login/signup'
    end
  end

  post '/signup' do
    session["signup_errors"] = ""
    if !params[:user][:username].empty? && !params[:user][:password].empty?
      user = User.create(params[:user])
      redirect '/'
    else
      session["signup_errors"] = "Something went wrong!"
      redirect '/signup'
    end

  end



end
