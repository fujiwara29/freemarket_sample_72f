class Items::SearchesController < ApplicationController
  def index
    @items = Item.name_like(params[:keyword]).order("created_at DESC")
  end
end
