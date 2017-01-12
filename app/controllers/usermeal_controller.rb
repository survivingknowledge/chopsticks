class UsermealController < AppController

  get '/:userid/meals/add/:fooditemid/?' do
    if logged_in? && current_user.id == params[:userid].to_i
      @fooditem = Fooditem.find_by_id(params[:fooditemid])
      if @fooditem
        session[:meals] << @fooditem.id
        redirect "/#{current_user.id}/meals/add"
      end
    else
      redirect '/'
    end
  end

  get '/:userid/meals/add/?' do
    if logged_in? && current_user.id == params[:userid].to_i
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
    if logged_in? && current_user.id == params[:userid].to_i
      @meals = current_user.meals
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

end
