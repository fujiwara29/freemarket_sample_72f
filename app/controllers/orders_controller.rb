class OrdersController < ApplicationController

  def new
    @item = Item.find(params[:format])
    @order = Order.new
    # @order = Order.find(params[:id])
    # @order = Order.find(1)
    
  end

  def create
    Order.create(order_params)
  end


  private
  def order_params
    params.require(:order).permit(:user, :item, :address)
  end
end
