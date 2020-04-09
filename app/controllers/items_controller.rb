class ItemsController < ApplicationController

  def index
    @category_parent = Category.where(ancestry: params[:id])
  end

  def new
    @children = Category.find(params[:parent_id]).children
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    # @item = Item.find(params[:id])
    @item = Item.find(1)
  end

end


