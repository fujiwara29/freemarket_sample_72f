class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
    @category_partent = Category.where("ancestry is null")
  end

  def show
  end
end
