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

  post '/fooditems' do
    @fooditem = Fooditem.new(params[:fooditem])
    @fooditem.user_id = current_user.id
    @fooditem.save
    redirect "/fooditems/#{@fooditem.id}"
  end



end