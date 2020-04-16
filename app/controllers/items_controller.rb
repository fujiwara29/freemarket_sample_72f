class ItemsController < ApplicationController

  before_action :set_category, only: [:new, :create ,:edit ,:update]
  before_action :set_brand, only: [:new, :create, :edit, :update]


  def index
    @newitems = Item.last(3)
  end

  def new
    @item = Item.new
    @item.images.build
  end

  def create
    @item = Item.new(item_params)
    images = params[:images][:image]
    respond_to do |format|
      if @item.valid? && (images.length >= 1) && (images.length <= 10)
        @item.save
        images.each do |image|
          @item.images.create(image: image, item_id: @item.id)
        end
        format.html{redirect_to root_path}
      else
        @item.images.build
        format.html{render action: 'new'}
      end
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @images = Image.where(item_id: params[:id])
  end

  def update
    @item = params[set_item]
    images = params[:images][:image]
    respond_to do |format|
      if @item.valid? && (images.length >= 1) && (images.length <= 10)
        @item.save
        images.each do |image|
          @item.images.create(image: image, item_id: @item.id)
        end
        format.html{redirect_to root_path}
      else
        @item.images.build
        format.html{render action: 'new'}
      end
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
    redirect_to root_path
    else
    redirect_to item_path
    end
  end

  
  private

  def set_category
    @category = Category.all()
  end

  def set_brand
    @brand = []
    # @brand = Bland.all()
  end

  def item_params
    params.require(:item)
    .permit(
      :name,
      :introduction,
      :category_id,
      :brand_id,
      :condition,
      :postage_payer,
      :prefecture_code,
      :preparation_day,
      :price,
    ).merge(
      trading: "販売中",
      user_id: current_user.id
    )
  end

end
