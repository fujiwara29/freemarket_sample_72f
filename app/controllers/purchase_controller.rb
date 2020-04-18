class PurchaseController < ApplicationController

  require 'payjp'

  before_action :set_item
  before_action :set_card

  def pay
    
    if set_card.blank?
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(set_card.customer_id)
      @default_card_information = customer.cards.retrieve(set_card.card_id)
    end
  end

  def done
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    :amount => @item.price,
    :customer => set_card.customer_id,
    :currency => 'jpy',
    )
    @item.update(trading:"売り切れ")
  end
  
  private

  def set_item
    @item = Item.find(params[:id])
  end

  def set_card
    card = Card.find_by(user_id: current_user.id)
  end

end