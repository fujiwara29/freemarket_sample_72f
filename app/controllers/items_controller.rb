class ItemsController < ApplicationController

  # before_action :set_group, onry: :index
  # before_action :move_to_index, except: [:index, :show]
  # ⬆ URL手打ち不正アクセス防止の為
  # ⬆ ユーザーログイン機能が無い間はコメントアウトにしておきます。

  def index
    @newitems = Item.last(3)
    @images = Image.last
    # binding.pry
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
    )
    .merge(trading: "販売中", user_id: "1")
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
