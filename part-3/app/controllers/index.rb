get '/' do
  @items = Item.active_items
  erb :index
end