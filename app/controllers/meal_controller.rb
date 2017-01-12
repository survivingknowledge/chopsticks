class MealController < AppController

  before do
    session[:meals] ||= []
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

  get '/meals/:id/?' do
    @user = current_user
    @meal = Meal.find_by_id(params[:id])
    if @meal
      @fooditems = @meal.fooditems
      erb :'meals/meal_show'
    else
      redirect '/meals'
    end
  end

  get '/meals/:id/edit/?' do
    @meal = Meal.find_by_id(params[:id])
    if @meal
      @fooditems = @meal.fooditems
      erb :'meals/meal_edit'
    else
      redirect '/meals'
    end
  end

  #all meals user has
  get '/meals/?' do
    if logged_in?
      @user = current_user
      @meals = Meal.all
      erb :'meals/meal_index'
    else
      session[:last_page] = '/meals'
      redirect '/login'
    end
  end

  get '/meals/new/?' do
    if logged_in?
      @user = current_user
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
    #here we don't check for duplicates yet
    @meal = Meal.new(params[:meal])
    @meal.fooditem_ids = params[:fooditem]
    @meal.save
    #clear session[:meals]
    session[:meals] = []
    redirect "/meals"
  end




end
