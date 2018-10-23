require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/pizza_order')

get "/pizza-orders" do
  @orders = PizzaOrder.all()
  erb(:index)
end

get "/pizza-orders/order/:id" do
  id = params[:id]
  @order = PizzaOrder.find(id)
  erb(:show)
end

get "/pizza-orders/new" do
  erb(:new)
end

post "/pizza-orders" do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end

get "/pizza-orders/update/:id" do
  @order = PizzaOrder.find(params[:id])
  erb(:edit)
end

post "/pizza-orders/update" do
  @order = PizzaOrder.new(params)
  @order.update
  erb(:update)
end

post "/pizza-orders/delete" do
  order = PizzaOrder.find(params[:id])
  order.delete()
  erb(:destroy)
end
