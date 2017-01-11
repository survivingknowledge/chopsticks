class FooditemController < AppController

  get '/fooditems/?' do
    @fooditems = Fooditem.all
    erb :'fooditems/index'
  end

  get '/fooditems/new/?' do
    if logged_in?
      erb :'/fooditems/new'
    else
      session[:last_page] = "/fooditems/new"
      redirect '/login'
    end

  end

  post '/fooditems/:id' do
    @fooditem = Fooditem.find_by_id(params[:id])
    @fooditem.update(params[:fooditem])
    @fooditem.save
    redirect "/fooditems/#{@fooditem.id}"
  end

  post '/fooditems' do

    @fooditem = Fooditem.new(params[:fooditem])
    @fooditem.user_id = current_user.id
    @fooditem.save
    redirect "/fooditems/#{@fooditem.id}"
  end

  get '/fooditems/:id/edit/?' do
    @fooditem = Fooditem.find_by_id(params[:id])
    if @fooditem
      erb :'fooditems/edit_fooditem'
    else
      redirect '/fooditems'
    end
  end



  get '/fooditems/:id' do
    @fooditem = Fooditem.find_by_id(params[:id])
    if @fooditem
      erb :'fooditems/show_fooditem'
    else
      redirect '/fooditems'
    end
  end

end