class ItemsController < ApplicationController

  def new
    @item = Item.new
    @image = Image.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path

    else
      render :new
    end
  end
  
  private

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :category, :brand, :condition, :postage_payer, :prefecture_code, :preparation_day, :price, :trading []).merge(user: current_user.id)
  end

end


