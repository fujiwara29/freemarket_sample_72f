class Items::SearchesController < ApplicationController

  def index
    if params[:keyword].nil?
      @category_items = Item.category_like(params[:format]).order("created_at DESC")
    else
      @items = Item.name_like(params[:keyword]).order("created_at DESC")
    end
  end

end
