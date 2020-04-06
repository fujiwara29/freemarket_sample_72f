class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
    # @item.images.new
    # @category_parent =  Category.where("ancestry is null")
  end
  # 親カテゴリーが選択された後に動くアクション
  def category_children
    @category_children = Category.find("#{params[:parent_id]}").children
    #親カテゴリーに紐付く子カテゴリーを取得
  end

  
  def show
  end

  def create
    @item = Item.new(product_params)
    if @Item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, images_attributes: [:src])
  end
end
