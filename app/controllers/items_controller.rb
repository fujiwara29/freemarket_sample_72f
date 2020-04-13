class ItemsController < ApplicationController

  def index
    @newitems = Item.last(3)
    @images = Image.last
  end

  def new
    @item = Item.new
    @item.images.build
    
  end

  def create
    @item = Item.new(item_params)
    respond_to do |format|
      if @item.save
          params[:images][:image].each do |image|
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
    # @item = Item.find(params[:id])
    @item = Item.find(1)
    
  end

  
  private

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
      images_attributes: [:image]
    ).merge(
      trading: "販売中",
      user_id: current_user.id
    )
  end

end


