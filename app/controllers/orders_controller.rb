class OrdersController < ApplicationController

  def new
    @order = Order.find(1)
  end

  def create
    Order.create(order_params)
  end

  def pay
    @item = Item.find(params[:item_id])

    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    :amount => @item.price, #支払金額を入力（itemテーブル等に紐づけても良い）
    :customer => card.customer_id, #顧客ID
    :currency => 'jpy', #日本円
  )
  redirect_to action: 'done' #完了画面に移動
  end


  private
  def order_params
    params.require(:order).permit(:user, :item, :address)
  end
end
