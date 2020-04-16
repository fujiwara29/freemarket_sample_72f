class ImagesController < ApplicationController

  before_action :set_image


  def edit
  end

  def update
  end

  private

  def set_image
    @images = Image.where(item_id:params[:id])
  end


end

# def image_update
#   @item = params[set_item]
#   images = params[:images][:image]
#   respond_to do |format|
#     if @item.valid? && (images.length >= 1) && (images.length <= 10)
#       @item.save
#       images.each do |image|
#         @item.images.update(image: image, item_id: @item.id)
#       end
#       format.html{redirect_to root_path}
#     else
#       flash.now[:alert] = '必須項目が入力されていません。'
#       @item.images.build
#       format.html{render action: 'edit'}
#     end
#   end
# end

