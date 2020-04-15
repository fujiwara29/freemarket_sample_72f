class CategoriesController < ApplicationController
  def index
    @category_parent = Category.where(ancestry: params[:id])

  end

  def show
    @category = Category.find(params[:id])
    @image = Image.where(params[:category_id])
    # @item = Item.find(params[:id])
  end
end
