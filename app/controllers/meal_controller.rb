class MealController < AppController

  before do
    session[:meals] ||= []
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

  #add a given foodid  session[:meals]
  get '/meals/add/:id/?' do
    @fooditem = Fooditem.find_by_id(params[:id])
    if @fooditem
      session[:meals] << @fooditem.id
      redirect '/meals/new'
    else
      redirect '/fooditems'
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
      @totals = {fat: 0.0, carbs: 0.0, protein: 0.0}

      @meals = session[:meals].collect do |foodid|
        f = Fooditem.find_by_id(foodid)

        @totals[:fat] += f.total_fat
        @totals[:carbs] += f.total_carbohydrate
        @totals[:protein] += f.protein
        f
      end
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
