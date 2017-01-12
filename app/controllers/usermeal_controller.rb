class UsermealController < AppController

  get '/:userid/meals/add/:fooditemid/?' do
    @user = current_user
    if logged_in? && @user.id == params[:userid].to_i
      @fooditem = Fooditem.find_by_id(params[:fooditemid])
      if @fooditem
        session[:meals] << @fooditem.id
        redirect "/#{@user.id}/meals/add"
      end
    else
      redirect '/'
    end
  end

  get '/:userid/meals/add/?' do
    @user = current_user
    if logged_in? && @user.id == params[:userid].to_i
      @totals = {fat: 0.0, carbs: 0.0, protein: 0.0}

      @meals = session[:meals].collect do |foodid|
        f = Fooditem.find_by_id(foodid)

        @totals[:fat] += f.total_fat
        @totals[:carbs] += f.total_carbohydrate
        @totals[:protein] += f.protein
        f
      end
      erb :'usermeals/usermeal_add'
    else
      redirect '/'
    end
  end

  get '/:userid/meals/?' do
    if logged_in? && @user.id == params[:userid].to_i

      @meals = @user.meals
      if @meals
        erb :'usermeals/usermeal_index'
      else
        redirect '/'
      end
    else
      session[:last_page] = '/:userid/meals'
      redirect '/login'
    end
  end

  post '/:userid/meals' do
    #create meal
    @meal = Meal.new(params[:meal])
    #associate fooditems with meal
    @meal.fooditem_ids = params[:fooditem]

    if @meal.save
      #need to use usermeal to get at other tables
      @usermeal = UserMeal.new
      @usermeal.user_id = @user.id
      @usermeal.meal_id = @meal.id
      @usermeal.date_eaten = Date.today
      @usermeal.time_eaten = Time.now
      @usermeal.save
      #clear session[:meals]
      session[:meals] = []
    else
      "something went wrong"
    end

    redirect "/#{@user.id}/meals"
  end

end
