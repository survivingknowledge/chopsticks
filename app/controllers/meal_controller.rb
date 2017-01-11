class MealController < AppController

  before do
    session[:meal] ||= []
  end

  #get users meals for today only
  get '/meals/today/?' do
    if logged_in?
      @meals = current_user.meals_today
      erb :'/meals/meal_show'
    else
      session[:last_page] = '/meals/today'
      redirect '/login'
    end
  end



  #all meals user has
  get '/meals/?' do
    if logged_in?
      @meals = current_user.meals
      erb :'meals/meal_index'
    else
      session[:last_page] = '/meals'
      redirect '/login'
    end
  end

  get '/meals/new/?' do
    if logged_in?
      @meals = session[:meals] ||= []
      erb :'meals/meal_new'
    else
      session[:last_page] = '/meals/new'
      redirect '/login'
    end
  end

  #add meal
  post '/meals' do
    binding.pry
  end




end
