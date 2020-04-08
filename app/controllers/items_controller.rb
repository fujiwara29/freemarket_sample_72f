class ItemsController < ApplicationController

  def new
    @item = Item.new
    @item.images.build
  end

  def create
    # binding.pry
    @item = Item.new(item_params)
    binding.pry
    respond_to do |format|
      binding.pry
      if @item.save
          params[:images][:image].each do |image|
            @item.images.create(image: image, item: @item.id)
          end
        format.html{redirect_to root_path}
      else
        @item.images.build
        format.html{render action: 'new'}
      end
    end
  end

  private

  def item_params
    params.require(:item)
    .permit(
      :name,
      :introduction,
      :category,
      :brand,
      :condition,
      :postage_payer,
      :prefecture_code,
      :preparation_day,
      :price,
      images_attributes: [:image]
    )
    .merge(trading: "販売中", user: "1")
  end

end