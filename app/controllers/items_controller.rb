class ItemsController < ApplicationController

  def index
    @category_parent = Category.where(ancestry: params[:id])
  end

  def new
  end

  def show
    # @item = Item.find(params[:id])
    @item = Item.find(1)
  end

end


