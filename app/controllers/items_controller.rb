class ItemsController < ApplicationController

  before_action :set_category, only: [:new, :create ,:edit ,:update]
  before_action :set_brand, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @newitems = Item.last(3)
  end

  def new
    @item = Item.new
    @item.images.build
  end

  def create
    @item = Item.new(item_params)
    imgs_params = params[:images][:image]
    respond_to do |format|
      if @item.valid? && (imgs_params.length >= 1) && (imgs_params.length <= 10)
        @item.save
        imgs_params.each do |image|
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
  end

  def edit
  end

  def update
    respond_to do |format|
      # 編集した商品情報の更新
      @item.update(item_params)
      
      # 画像を追加した場合の処理
      if params[:images].nil?
      else
        imgs_params = params[:images][:image]
        if (imgs_params.length >= 1) && (imgs_params.length <= 10)
          imgs_params.each do |image|
            Image.create(image: image, item_id: @item.id)
          end
        end
      end
      
      #DBの画像が0になる場合は処理をしないようにする
      db_image = Image.where(item_id: @item.id)
      destroy_images_box = []
      @item.images.each do |destroy_check_image|
        if params[:item][:imag_destroy][:"#{destroy_check_image.id}"] == "1"
        destroy_images_box << destroy_check_image
        end
      end
      
      # データベースのimage数と削除image数を比較
      if db_image.length > destroy_images_box.length
        # 既存の画像を削除した場合の処理
        destroy_images_box.each do |destroy_image|
          destroimage = Image.find_by(id: destroy_image.id)
          destroimage.destroy
        end
      else
        # image数が0になる場合の処理
        format.html{redirect_to edit_item_path, notice: '画像は1枚以上登録してください！'}
      end
    format.html{redirect_to item_path}
    end
  end

  def destroy
    if @item.destroy
    else
    redirect_to item_path
    end
  end

  private
  
  def set_item
    @item = Item.find(params[:id])
  end
  
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