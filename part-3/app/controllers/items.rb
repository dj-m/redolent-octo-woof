get '/items/new/?' do
  if logged_in?
    @item = Item.new(session[:item].to_h) || Item.new
    session.delete(:item)
    @errors = session[:errors] || []
    session.delete(:errors)
    erb :'items/new'
  else
    status 404
  end
end

post '/items' do
  if logged_in?
    item = Item.new(params[:item])
    item.seller = current_user
    if item.save
      redirect "/users/#{current_user_name}"
    else
      session[:errors] = item.errors.full_messages
      session[:item] = params[:item].to_a
      redirect '/items/new'
    end
  else
    status 404
  end
end

get '/items/:id/edit/?' do
  @item = Item.find_by(id: params[:id])
  if logged_in? && @item && @item.seller == current_user
    @item.update_attributes(session[:item].to_h) if session[:item]
    session.delete(:item)
    @errors = session[:errors] || []
    session.delete(:errors)
    erb :'items/edit'
  else
    status 404
  end
end

patch '/items/:id' do
  item = Item.find_by(id: params[:id])
  if logged_in? && item && item.seller == current_user
    item.update_attributes(params[:item])
    if item.save
      redirect "/users/#{current_user_name}"
    else
      session[:errors] = item.errors.full_messages
      session[:item] = params[:item].to_a
      redirect "/items/#{item.id}/edit"
    end
  else
    status 404
  end
end

delete '/items/:id' do
  item = Item.find_by(id: params[:id])
  if logged_in? && item && item.seller == current_user
    item.destroy
    redirect "/users/#{current_user_name}"
  else
    status 404
  end
end

get '/items/:id' do
  @item = Item.find_by(id: params[:id])
  @errors = session[:errors] || []
  session.delete(:errors)
  erb :'items/show'
end

post '/items/:id/bids' do
  item = Item.find_by(id: params[:id])
  bid = Bid.new(bidder: current_user, item: item, amount: params[:amount])
  unless bid.save
    session[:errors] = bid.errors.full_messages
  end
  redirect "/items/#{item.id}"
end